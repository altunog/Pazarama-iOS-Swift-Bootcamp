//
//  MusicRequest.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 8.10.2022.
//

import Foundation

struct MusicRequest: Requestable {
    
    var searchText: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : "music"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String) {
        self.searchText = searchText
    }
    
    func decodeResponse(_ data: Data) throws -> MusicResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(MusicResponse.self, from: data)
        return response
    }
}
