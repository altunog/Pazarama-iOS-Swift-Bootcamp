//
//  Movie.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 7.10.2022.
//

import Foundation

struct Movie: Decodable {
    let directorName: String?
    let trackName: String?
    let artworkLarge: URL?
    let releaseDate: String?
    let country: String?
    let genre: String?
    let contentAdvisoryRating: String?
    
    enum CodingKeys: String, CodingKey {
        case directorName = "artistName"
        case trackName
        case artworkLarge = "artworkUrl100"
        case releaseDate
        case country
        case genre = "primaryGenreName"
        case contentAdvisoryRating
    }
}
