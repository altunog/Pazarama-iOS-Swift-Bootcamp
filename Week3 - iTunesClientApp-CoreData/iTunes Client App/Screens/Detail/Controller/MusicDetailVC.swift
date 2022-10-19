//
//  MusicDetailVC.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 8.10.2022.
//

import UIKit

final class MusicDetailVC: UIViewController {
    
    var music: Music? {
        didSet {
            title = music?.trackName
            detailView.imageView.downloadImage(from: music?.artworkLarge)
            detailView.releaseDate = music?.releaseDate
            detailView.artistName = music?.artistName
            detailView.collectionName = music?.collectionName
            detailView.country = music?.country
            detailView.genre = music?.genre
        }
    }
    
    private let detailView = DetailView(media: .music)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view = detailView
    }
}
