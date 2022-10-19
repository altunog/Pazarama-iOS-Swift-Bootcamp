//
//  EBook.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 7.10.2022.
//

import Foundation

struct EBook: Decodable {
    let authorName: String?
    let bookName: String?
    let artworkLarge: URL?
    let releaseDate: String?
    let genres: [String]?
    let userRating: Double?
    
    enum CodingKeys: String, CodingKey {
        case authorName = "artistName"
        case bookName = "trackName"
        case artworkLarge = "artworkUrl100"
        case releaseDate
        case genres
        case userRating = "averageUserRating"
    }
}
