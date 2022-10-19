//
//  Requestable.swift
//  ArabamAssignment
//
//  Created by Muhammed Karakul on 10.01.2022.
//

import Foundation

protocol Requestable {
    associatedtype Response
    var baseURL: String { get }
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
    var queryItems: [String : String] { get }
    
    func decodeResponse(_ data: Data) throws -> Response
}

extension Requestable where Response: Decodable {
    func decodeResponse(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}

extension Requestable {
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
        [:]
    }
}
