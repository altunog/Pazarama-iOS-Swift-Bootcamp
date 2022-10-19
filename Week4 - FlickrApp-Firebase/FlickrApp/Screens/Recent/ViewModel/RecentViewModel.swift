//
//  RecentViewModel.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 19.10.2022.
//

import Foundation

enum RecentViewModelChanges {
	case didErrorOccur(_ error: Error)
	case didFetchPhotos
}

final class RecentViewModel {
	
	var changeHandler: ((RecentViewModelChanges) -> Void)?
	
	private var photosResponse: PhotosResponse? {
		didSet {
			self.changeHandler?(.didFetchPhotos)
		}
	}
	
	var numberOfRows: Int {
		photosResponse?.photos?.photo?.count ?? .zero
	}
		
	func fetchPhotos() {
		
		provider.request(.photosGetRecent) { result in
			switch result {
			case let .failure(error):
				self.changeHandler?(.didErrorOccur(error))
			case let .success(response):
				do {
					let photosResponse = try JSONDecoder().decode(PhotosResponse.self, from: response.data)
					self.photosResponse = photosResponse
				} catch {
					self.changeHandler?(.didErrorOccur(error))
				}
			}
		}
	}
	
	func photoForIndexPath(_ indexPath: IndexPath) -> Photo? {
		photosResponse?.photos?.photo?[indexPath.row]
	}
	
}
