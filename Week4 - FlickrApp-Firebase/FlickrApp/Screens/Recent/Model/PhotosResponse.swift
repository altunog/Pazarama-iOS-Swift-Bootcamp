//
//  PhotosResponse.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 19.10.2022.
//

import Foundation

struct PhotosResponse: Codable {
	let photos: Photos?
	let stat: String?
}
