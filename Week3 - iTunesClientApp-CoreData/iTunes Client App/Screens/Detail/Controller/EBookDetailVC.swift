//
//  EBookDetailVC.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 9.10.2022.
//

import UIKit

final class EBookDetailVC: UIViewController {

    var ebook: EBook? {
        didSet {
            title = ebook?.bookName
            detailView.imageView.downloadImage(from: ebook?.artworkLarge)
            detailView.releaseDate = ebook?.releaseDate
            detailView.authorName = ebook?.authorName
            detailView.genres = ebook?.genres?.joined(separator: ", ")
            guard let userRating = ebook?.userRating else { return }
            detailView.userRating = String(format: "%.1f", userRating)
        }
    }
    
    private let detailView = DetailView(media: .ebook)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        view = detailView
    }

}
