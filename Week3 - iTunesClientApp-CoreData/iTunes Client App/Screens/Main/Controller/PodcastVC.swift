//
//  MainViewController.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import UIKit

final class PodcastVC: UIViewController {
    
    // MARK: - Properties
    private let mainView = MainView()
    private let searchController = UISearchController()
    private let networkService = BaseNetworkService()
    private var podcastResponse: PodcastResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Education, Fun..."
        searchController.searchResultsUpdater = self
        
        fetchPodcasts()
    }
    
    // MARK: - Methods
    private func fetchPodcasts(with text: String = "Podcast") {
        networkService.request(PodcastRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.podcastResponse = response
            case .failure(let error):
//                fatalError(error.localizedDescription)
                print(error)
                return
            }
        }
    }
}

// MARK: - UICollectionViewDelegate
extension PodcastVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = PodcastDetailVC()
        detailVC.podcast = podcastResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
//		present(detailVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension PodcastVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        podcastResponse?.resultCount ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MediaCollectionViewCell
        let podcast = podcastResponse?.results?[indexPath.row]
        cell.title = podcast?.trackName
        cell.imageView.downloadImage(from: podcast?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension PodcastVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchPodcasts(with: text)
        }
    }
}


