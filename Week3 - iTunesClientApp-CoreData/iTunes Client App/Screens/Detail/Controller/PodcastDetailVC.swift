//
//  PodcastDetailVC.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 2.10.2022.
//

import UIKit
import CoreData

final class PodcastDetailVC: UIViewController {
    
    var podcast: Podcast? {
        didSet {
            title = podcast?.trackName
            detailView.imageView.downloadImage(from: podcast?.artworkLarge)
            detailView.releaseDate = podcast?.releaseDate
            detailView.artistName = podcast?.artistName
            detailView.country = podcast?.country
            detailView.genres = podcast?.genres?.joined(separator: ", ")
        }
    }
    
	let db = DBManager()
    private var isFavorited: Bool = false
    private var favoriteButton = UIBarButtonItem()
    private let detailView = DetailView(media: .podcast)

	override func viewDidLoad() {
		super.viewDidLoad()
		view = detailView
		
		if DBManager.favoritesList.count > 0 {
			db.fetchItems()
			if let podcast = podcast {
				isFavorited = db.checkFavoritesList(mediaName: podcast.trackName!, mediaOwnerName: podcast.artistName!, mediaType: .podcast)
			}
		}
		
		configureNavBar()
	}
    
    private func configureNavBar() {
        navigationItem.largeTitleDisplayMode = .never
		
        favoriteButton = UIBarButtonItem(
			image: UIImage(systemName: isFavorited ? "heart.fill" : "heart"),
            style: .plain,
            target: self,
            action: #selector(favoriteButtonTapped))
        
        navigationItem.rightBarButtonItem = favoriteButton
    }
	
    
    @objc func favoriteButtonTapped() {
        guard let podcast = podcast else { return }
		guard let image = detailView.imageView.image else { return }
		let podcastDbModel = db.convertToDbModel(podcast: podcast, image: image)
		
        if isFavorited {
            favoriteButton.image = UIImage(systemName: "heart")
			db.delete(media: podcastDbModel)
            print("Removed from fav")
        } else { // else append to favorite podcasts array
            favoriteButton.image = UIImage(systemName: "heart.fill")
			db.create(media: podcastDbModel)
			print("Added to fav")
        }
        
        isFavorited.toggle()
    }

}

