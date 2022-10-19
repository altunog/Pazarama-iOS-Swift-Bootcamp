//
//  SoftwareDetailVC.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 9.10.2022.
//

import UIKit

class SoftwareDetailVC: UIViewController {

    var software: Software? {
        didSet {
            title = software?.trackName
            detailView.imageView.downloadImage(from: software?.artworkLarge)
            detailView.developerName = software?.developerName
            detailView.releaseDate = software?.releaseDate
            detailView.genres = software?.genres?.joined(separator: ", ")
            guard let userRating = software?.userRating else { return }
            detailView.userRating = String(format: "%.1f", userRating)
        }
    }
    
    private let detailView = DetailView(media: .software)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view = detailView
    }

}
