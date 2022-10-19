//
//  SoftwareVC.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 6.10.2022.
//

import UIKit

class SoftwareVC: UIViewController {

    private let mainView = MainView()
    private let searchController = UISearchController()
    private let networkService = BaseNetworkService()
    private var softwareResponse: SoftwareResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search for a software..."
        searchController.searchResultsUpdater = self
        
        fetchSoftware()
        view.backgroundColor = .systemPink
    }
    
    // MARK: - Methods
    private func fetchSoftware(with text: String = "Software") {
        networkService.request(SoftwareRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.softwareResponse = response
            case .failure(let error):
//                fatalError(error.localizedDescription)
                print(error)
                return
            }
        }
    }

}

// MARK: - UICollectionViewDelegate
extension SoftwareVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = SoftwareDetailVC()
        detailVC.software = softwareResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension SoftwareVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        softwareResponse?.resultCount ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MediaCollectionViewCell
        let software = softwareResponse?.results?[indexPath.row]
        cell.title = software?.trackName
        cell.imageView.downloadImage(from: software?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension SoftwareVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchSoftware(with: text)
        }
    }
}


