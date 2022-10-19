//
//  Music.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 7.10.2022.
//

import Foundation

struct Music: Codable {
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let artworkLarge: URL?
    let releaseDate: String?
    let country: String?
    let genre: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case collectionName
        case trackName
        case artworkLarge = "artworkUrl100"
        case releaseDate
        case country
        case genre = "primaryGenreName"
    }
}
