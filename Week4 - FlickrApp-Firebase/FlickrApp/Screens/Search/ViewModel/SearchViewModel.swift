//
//  SearchViewModel.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 19.10.2022.
//

import Foundation

enum SearchViewModelChanges {
	case didErrorOccur(_ error: Error)
	case didFetchSearchPhotos
}

final class SearchViewModel {
	
	var changeHandler: ((SearchViewModelChanges) -> Void)?
	
	private var searchResponse: PhotosResponse? {
		didSet {
			self.changeHandler?(.didFetchSearchPhotos)
		}
	}
	
	var numberOfItems: Int {
		searchResponse?.photos?.photo?.count ?? .zero
	}
	
	func fetchSearchPhotos(for text: String = "Bosphorus") {
		
		provider.request(.photosSearch(text: text)) { result in
			switch result {
			case let .failure(error):
				self.changeHandler?(.didErrorOccur(error))
			case let .success(response):
				do {
					let searchResponse = try JSONDecoder().decode(PhotosResponse.self, from: response.data)
					self.searchResponse = searchResponse
				} catch {
					self.changeHandler?(.didErrorOccur(error))
				}
			}
		}
	}
	
	func photoForCellIndexPath(_ indexPath: IndexPath) -> Photo? {
		searchResponse?.photos?.photo?[indexPath.row]
	}
	
}
