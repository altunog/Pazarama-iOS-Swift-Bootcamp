//
//  Photos.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 19.10.2022.
//

import Foundation

struct Photos: Codable {
	let page: Int?
	let pages: Int?
	let perpage: Int?
	let total: Int?
	let photo: [Photo]?
}

