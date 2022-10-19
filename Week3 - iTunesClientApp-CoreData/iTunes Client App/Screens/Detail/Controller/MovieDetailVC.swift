//
//  MovieDetailVC.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 9.10.2022.
//

import UIKit

class MovieDetailVC: UIViewController {

    var movie: Movie? {
        didSet {
            title = movie?.trackName
            detailView.imageView.downloadImage(from: movie?.artworkLarge)
            detailView.releaseDate = movie?.releaseDate
            detailView.directorName = movie?.directorName
            detailView.country = movie?.country
            detailView.genre = movie?.genre
            detailView.contentAdvisoryRating = movie?.contentAdvisoryRating
        }
    }
    
    private let detailView = DetailView(media: .movie)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view = detailView
    }
}
