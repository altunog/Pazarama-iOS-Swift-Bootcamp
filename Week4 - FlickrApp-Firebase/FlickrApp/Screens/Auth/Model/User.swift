//
//  User.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 17.10.2022.
//

import Foundation

struct User: Codable {
	var username: String?
	var email: String?
	var profilePhoto: String?
	var likedPhotos: [String]?
	var savedPhotos: [String]?
	
	enum CodingKeys: String, CodingKey {
		case username
		case email
		case profilePhoto
		case likedPhotos
		case savedPhotos
	}
}
