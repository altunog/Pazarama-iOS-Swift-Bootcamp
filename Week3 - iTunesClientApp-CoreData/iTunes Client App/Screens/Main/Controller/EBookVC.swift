//
//  EBookVC.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 6.10.2022.
//

import UIKit

class EBookVC: UIViewController {

    private let mainView = MainView()
    private let searchController = UISearchController()
    private let networkService = BaseNetworkService()
    private var ebookResponse: EBookResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search for an ebook..."
        searchController.searchResultsUpdater = self
        
        fetchEBook()
        view.backgroundColor = .systemPink
    }
    
    // MARK: - Methods
    private func fetchEBook(with text: String = "EBook") {
        networkService.request(EBookRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.ebookResponse = response
            case .failure(let error):
//                fatalError(error.localizedDescription)
                print(error)
                return
            }
        }
    }

}

// MARK: - UICollectionViewDelegate
extension EBookVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = EBookDetailVC()
        detailVC.ebook = ebookResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension EBookVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ebookResponse?.resultCount ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MediaCollectionViewCell
        let ebook = ebookResponse?.results?[indexPath.row]
        cell.title = ebook?.bookName
        cell.imageView.downloadImage(from: ebook?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension EBookVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchEBook(with: text)
        }
    }

}
