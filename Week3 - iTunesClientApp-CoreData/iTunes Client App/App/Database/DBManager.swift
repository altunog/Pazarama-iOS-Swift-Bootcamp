//
//  DBManager.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 11.10.2022.
//

import UIKit
import CoreData

class DBManager {
	
	static var favoritesList = [DBModel]()
	
	static let appDelegate = UIApplication.shared.delegate as! AppDelegate
	static let context = appDelegate.persistentContainer.viewContext
	static let entity = NSEntityDescription.entity(forEntityName: "Favorites", in: context)!
	
	var item = NSManagedObject(entity: entity, insertInto: context)
	
	func create(media: DBModel) {
		item.setValue(media.id, 				forKey: "id")
		item.setValue(media.mediaType.rawValue, forKey: "mediaType")
		item.setValue(media.mediaName, 			forKey: "mediaName")
		item.setValue(media.mediaOwnerName, 	forKey: "mediaOwnerName")
		item.setValue(media.releaseDate, 		forKey: "releaseDate")
		item.setValue(media.artwork, 			forKey: "artwork")
		
		save()
		//		DBManager.favoritesList.append(media)
	}
	
	func delete(media: DBModel) {
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
//		let itemId = media.id.uuidString
		fetchRequest.predicate = NSPredicate(format: "mediaName = %@", media.mediaName)
		
		do {
			let fetchResults = try DBManager.context.fetch(fetchRequest)
			let objectToDelete = fetchResults[0] as! NSManagedObject
			DBManager.context.delete(objectToDelete)
			save()
		} catch {
			print("Not deleted \(error.localizedDescription)")
		}
	}
	
	func save() {
		do {
			try DBManager.context.save()
		} catch {
			print("Not saved \(error.localizedDescription)")
		}
	}
	
	func fetchItems() {
		DBManager.favoritesList.removeAll()
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorites")
		do {
			let fetchResults = try DBManager.context.fetch(fetchRequest)
			for item in fetchResults as! [NSManagedObject] {
				if item.value(forKey: "id") != nil {
					let media = DBModel(
						id: item.value(forKey: "id") as! UUID,
						artwork: item.value(forKey: "artwork") as! Data,
						mediaName: item.value(forKey: "mediaName") as! String,
						mediaOwnerName: item.value(forKey: "mediaOwnerName") as! String,
						mediaType: MediaType(rawValue: item.value(forKey: "mediaType") as! String)!,
						releaseDate: item.value(forKey: "releaseDate") as! String
					)
					DBManager.favoritesList.append(media)
				}
			}
		} catch {
			print("Not fetched \(error.localizedDescription)")
		}
	}
	
	func convertToDbModel(podcast: Podcast, image: UIImage) -> DBModel {
		return DBModel(id: UUID(),
					   artwork: image.jpegData(compressionQuality: 1.0)!,
					   mediaName: podcast.trackName!,
					   mediaOwnerName: podcast.artistName!,
					   mediaType: .podcast,
					   releaseDate: podcast.releaseDate!)
	}
	
	func checkFavoritesList(mediaName: String, mediaOwnerName: String, mediaType: MediaType) -> Bool {
		for favorite in DBManager.favoritesList {
			if favorite.mediaName == mediaName &&
				favorite.mediaOwnerName == mediaOwnerName &&
				favorite.mediaType == mediaType {
				return true
			}
		}
		return false
	}
}
