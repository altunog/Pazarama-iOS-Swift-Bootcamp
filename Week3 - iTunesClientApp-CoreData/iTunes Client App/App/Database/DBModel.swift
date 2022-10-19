//
//  DBModel.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 11.10.2022.
//

import Foundation

struct DBModel {
	var id: UUID
	var artwork: Data
	var mediaName: String
	var mediaOwnerName: String
	var mediaType: MediaType
	var releaseDate: String
}
