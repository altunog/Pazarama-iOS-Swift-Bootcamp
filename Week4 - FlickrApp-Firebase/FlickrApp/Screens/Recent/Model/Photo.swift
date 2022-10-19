//
//  Photo.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 19.10.2022.
//

import Foundation

struct Photo: Codable {
	
	let id: String?
	let owner: String?
	let secret: String?
	let server: String?
	let farm: Int?
	let title: String?
	let ispublic: Int?
	let isfriends: Int?
	let isfamily: Int?
	let ownername: String?
	let iconserver: String?
	let iconfarm: Int?
	let faveCount: String?
	let urlN320: String?
	let heightN: Int?
	let widthN: Int?
	
	enum CodingKeys: String, CodingKey {
		case id, owner, secret, server, farm, title, ispublic, isfriends, isfamily
		case ownername, iconserver, iconfarm
		case faveCount = "count_faves"
		case urlN320 = "url_n"
		case heightN = "height_n"
		case widthN = "width_n"
	}
}

extension Photo {
	
	var photoURL: URL {
		if let urlString = urlN320,
			let url = URL(string: urlString) {
			return url
		}
		return URL(string: "https://www.flickr.com/images/buddyicon.gif")!
	}
	
	var height: Double {
		Double(heightN ?? 48)
	}
	
	var width: Double {
		Double(widthN ?? 48)
	}
	
	var ratio: CGFloat {
		CGFloat(width / height)
	}
	
	var userIconUrl: URL {
		if let iconFarm = iconfarm,
		   let iconServer = iconserver,
		   let nsId = owner,
		   Int(iconServer) ?? 0 > 0 {
			return URL(string: "https://farm\(iconFarm).staticflickr.com/\(iconServer)/buddyicons/\(nsId).jpg")!
		}
		return URL(string: "https://www.flickr.com/images/buddyicon.gif")!
	}
	
	var username: String {
		guard let username = ownername else { return "" }
		return username
	}
	
	var numberOfFaves: String {
		guard let faveCount = faveCount else { return "0" }
		return faveCount
	}
}

