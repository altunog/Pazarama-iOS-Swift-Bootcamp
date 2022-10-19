//
//  MediaResponse.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import Foundation

struct PodcastResponse: Decodable {
    let resultCount: Int?
    let results: [Podcast]?
}

struct MusicResponse: Decodable {
    let resultCount: Int?
    let results: [Music]?
}

struct MovieResponse: Decodable {
    let resultCount: Int?
    let results: [Movie]?
}

struct SoftwareResponse: Decodable {
    let resultCount: Int?
    let results: [Software]?
}

struct EBookResponse: Decodable {
    let resultCount: Int?
    let results: [EBook]?
}
