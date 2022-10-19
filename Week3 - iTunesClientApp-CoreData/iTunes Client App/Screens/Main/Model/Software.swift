//
//  Software.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 7.10.2022.
//

import Foundation

struct Software: Decodable {
    let developerName: String
    let trackName: String
    let artworkLarge: URL?
    let releaseDate: String?
    let genres: [String]?
    let userRating: Double?
    
    enum CodingKeys: String, CodingKey {
        case developerName = "artistName"
        case trackName
        case artworkLarge = "artworkUrl512"
        case releaseDate
        case genres
        case userRating = "averageUserRatingForCurrentVersion"
    }
}
