//
//  MusicVC.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 6.10.2022.
//

import UIKit

class MusicVC: UIViewController {

    private let mainView = MainView()
    private let searchController = UISearchController()
    private let networkService = BaseNetworkService()
    private var musicResponse: MusicResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Hip-hop, Pop, Rock..."
        searchController.searchResultsUpdater = self
        
        fetchMusic()
    }
    
    // MARK: - Methods
    private func fetchMusic(with text: String = "Music") {
        networkService.request(MusicRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.musicResponse = response
            case .failure(let error):
//                fatalError(error.localizedDescription)
                print(error)
                return
            }
        }
    }

}

// MARK: - UICollectionViewDelegate
extension MusicVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = MusicDetailVC()
        detailVC.music = musicResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MusicVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        musicResponse?.resultCount ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MediaCollectionViewCell
        let music = musicResponse?.results?[indexPath.row]
        cell.title = music?.trackName
        cell.imageView.downloadImage(from: music?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension MusicVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchMusic(with: text)
        }
    }
}
