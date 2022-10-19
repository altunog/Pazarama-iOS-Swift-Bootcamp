//
//  MovieVC.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 6.10.2022.
//

import UIKit

class MovieVC: UIViewController {

    private let mainView = MainView()
    private let searchController = UISearchController()
    private let networkService = BaseNetworkService()
    private var movieResponse: MovieResponse? {
        didSet {
            mainView.refresh()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
        
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search for a movie..."
        searchController.searchResultsUpdater = self
        
        fetchMovie()
        view.backgroundColor = .systemPink
    }
    
    // MARK: - Methods
    private func fetchMovie(with text: String = "Movie") {
        networkService.request(MovieRequest(searchText: text)) { result in
            switch result {
            case .success(let response):
                self.movieResponse = response
            case .failure(let error):
//                fatalError(error.localizedDescription)
                print(error)
                return
            }
        }
    }

}

// MARK: - UICollectionViewDelegate
extension MovieVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = MovieDetailVC()
        detailVC.movie = movieResponse?.results?[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MovieVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieResponse?.resultCount ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MediaCollectionViewCell
        let movie = movieResponse?.results?[indexPath.row]
        cell.title = movie?.trackName
        cell.imageView.downloadImage(from: movie?.artworkLarge)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - UISearchResultsUpdating
extension MovieVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 1 {
            fetchMovie(with: text)
        }
    }
}
