//
//  SoftwareResponse.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 9.10.2022.
//

import Foundation

struct SoftwareRequest: Requestable {
    
    var searchText: String
    
    var baseURL: String {
        "https://itunes.apple.com"
    }
    
    var url: String {
        "/search"
    }
    
    var queryItems: [String : String] {
        ["term": searchText,
         "media" : "software"]
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(searchText: String) {
        self.searchText = searchText
    }
    
    func decodeResponse(_ data: Data) throws -> SoftwareResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let response = try decoder.decode(SoftwareResponse.self, from: data)
        return response
    }
}
