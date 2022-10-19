//
//  PodcastRequest.swift
//  ArabamAssignment
//
//  Created by Muhammed Karakul on 11.01.2022.
//

import Foundation

struct PodcastRequest: Requestable {
    
    var searchText: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : "podcast"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String) {
        self.searchText = searchText
    }
    
    func decodeResponse(_ data: Data) throws -> PodcastResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(PodcastResponse.self, from: data)
        return response
    }
}
