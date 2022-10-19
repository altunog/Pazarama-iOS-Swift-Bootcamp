//
//  FavoritesDetailVC.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 10.10.2022.
//

import UIKit
import CoreData

class FavoritesDetailVC: UIViewController {

    private let detailView = DetailView(media: .other)
    
	let db = DBManager()
	
	var media: DBModel? {
		didSet {
			title = media?.mediaName
			if let imageData = media?.artwork {
				detailView.imageView.image = UIImage(data: imageData)
			}
			detailView.artistName = media?.mediaOwnerName
			detailView.releaseDate = media?.releaseDate
		}
	}
	private var favoriteButton = UIBarButtonItem()
	private var isFavorited: Bool = true
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view = detailView
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
		guard let media = media else { return }
		
		if isFavorited {
			favoriteButton.image = UIImage(systemName: "heart")
			db.delete(media: media)
			print("Removed from fav")
		} else { // else append to favorite podcasts array
			favoriteButton.image = UIImage(systemName: "heart.fill")
			db.create(media: media)
			print("Added to fav again")
		}
		
		isFavorited.toggle()
	}
}
