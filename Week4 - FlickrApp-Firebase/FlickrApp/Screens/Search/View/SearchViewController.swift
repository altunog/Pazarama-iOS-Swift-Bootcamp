//
//  SearchViewController.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 18.10.2022.
//

import UIKit

class SearchViewController: UIViewController {

	private var collectionView: UICollectionView?
	private var viewModel = SearchViewModel()
	private let searchController = UISearchController()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		configureViewController()
		configureCollectionView()
		
		viewModel.fetchSearchPhotos()
		viewModel.changeHandler = { change in
			switch change {
			case .didFetchSearchPhotos:
				self.refresh()
				print("Search Fetched")
			case .didErrorOccur(let error):
				self.showError(error)
			}
		}
		
		configureSearchController()
    }
	
	func configureViewController() {
		
		title = "Search"
		view.backgroundColor = .MyTheme.coal
	}
	
	func configureCollectionView() {
		collectionView = UICollectionView(frame: view.bounds,
										  collectionViewLayout: createTwoColumnFlowLayout())
		guard let collectionView = collectionView else { return }
		collectionView.register(SearchCell.self, forCellWithReuseIdentifier: SearchCell.identifier)
		collectionView.delegate = self
		collectionView.dataSource = self
		view.addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.snp.makeConstraints { make in
			make.leading.equalTo(view.snp.leading)
			make.trailing.equalTo(view.snp.trailing)
			make.top.equalTo(view.snp.top)
			make.bottom.equalTo(view.snp.bottom)
		}
		collectionView.backgroundColor = .MyTheme.smoke
	}
	
	func createTwoColumnFlowLayout() -> UICollectionViewFlowLayout {

		let flowLayout = UICollectionViewFlowLayout()
		flowLayout.scrollDirection = .vertical
		flowLayout.minimumLineSpacing = 0
		flowLayout.minimumInteritemSpacing = 0
		flowLayout.itemSize = CGSize(
			width: (UIScreen.main.bounds.width / 3) - 0.5,
			height: (UIScreen.main.bounds.width / 3) - 0.5
		)
		return flowLayout
	}
	
	func configureSearchController() {
		navigationItem.searchController = searchController
		searchController.searchBar.placeholder = "Discover..."
		searchController.searchResultsUpdater = self
	}
	
	func refresh() {
		DispatchQueue.main.async {
			self.collectionView?.reloadData()
		}
	}
	
}

// MARK: - UICollectionViewDelegate
extension SearchViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
	}
}

// MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.numberOfItems
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as? SearchCell else {
			fatalError("SearchCell not found.")
		}
		
		guard let photo = viewModel.photoForCellIndexPath(indexPath) else {
			fatalError("photo item not found.")
		}
		
		cell.url = photo.photoURL
		cell.imageView.kf.setImage(with: photo.photoURL) { _ in
			collectionView.reloadItems(at: [indexPath])
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		
		collectionView.reloadItems(at: [indexPath])
	}

}

// MARK: - UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		if let text = searchController.searchBar.text, text.count > 1 {
			viewModel.fetchSearchPhotos(for: text)
		}
	}
}

