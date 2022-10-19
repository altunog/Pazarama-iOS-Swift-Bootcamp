//
//  Encodable+Extensions.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 17.10.2022.
//

import Foundation

extension Encodable {
	
	var dictionary: [String: Any]? {
		get throws {
			let data = try JSONEncoder().encode(self)
			let dictionary = try JSONSerialization.jsonObject(with: data,
															  options: .allowFragments) as? [String: Any]
			return dictionary
		}
	}
	
	var dictionaryV2: [String: Any] {
			let data = (try? JSONEncoder().encode(self)) ?? Data()
			return (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]) ?? [:]
		}
}
