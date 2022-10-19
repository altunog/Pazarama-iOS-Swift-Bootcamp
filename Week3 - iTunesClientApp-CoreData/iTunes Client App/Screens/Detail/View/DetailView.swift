//
//  DetailView.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 2.10.2022.
//

import UIKit

final class DetailView: UIView {
    var releaseDate: String? {
        didSet {
            releaseDateKeyLabel.text = "Release Date:"
            releaseDateKeyLabel.textAlignment = .left
            releaseDateKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            releaseDateKeyLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            releaseDateLabel.text = releaseDate ?? "-"
            releaseDateLabel.textAlignment = .right
            releaseDateLabel.numberOfLines = .zero
        }
    }
    
    var artistName: String? {
        didSet {
            artistNameKeyLabel.text = "Artist Name:"
            artistNameKeyLabel.textAlignment = .left
            artistNameKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            artistNameKeyLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            artistNameLabel.text = artistName ?? "-"
            artistNameLabel.textAlignment = .right
            artistNameLabel.numberOfLines = .zero
        }
    }
    
    var developerName: String? {
        didSet {
            developerNameKeyLabel.text = "Developer:"
            developerNameKeyLabel.textAlignment = .left
            developerNameKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            developerNameKeyLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            developerNameLabel.text = developerName ?? "-"
            developerNameLabel.textAlignment = .right
            developerNameLabel.numberOfLines = .zero
        }
    }
    
    var authorName: String? {
        didSet {
            authorNameKeyLabel.text = "Author:"
            authorNameKeyLabel.textAlignment = .left
            authorNameKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            authorNameKeyLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            authorNameLabel.text = authorName ?? "-"
            authorNameLabel.textAlignment = .right
            authorNameLabel.numberOfLines = .zero
        }
    }
    
    var directorName: String? {
        didSet {
            directorNameKeyLabel.text = "Director:"
            directorNameKeyLabel.textAlignment = .left
            directorNameKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            directorNameKeyLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            directorNameLabel.text = directorName ?? "-"
            directorNameLabel.textAlignment = .right
            directorNameLabel.numberOfLines = .zero
        }
    }
    
    
    var country: String? {
        didSet {
            countryKeyLabel.text = "Country:"
            countryKeyLabel.textAlignment = .left
            countryKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            countryKeyLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            countryLabel.text = country ?? "-"
            countryLabel.textAlignment = .right
            countryLabel.numberOfLines = .zero
        }
    }
    
    var genres: String? {
        didSet {
            genresKeyLabel.text = "Genres:"
            genresKeyLabel.textAlignment = .left
            genresKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            genresKeyLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            genresLabel.text = genres ?? "-"
            genresLabel.textAlignment = .right
            genresLabel.numberOfLines = .zero
        }
    }
    
    var genre: String? {
        didSet {
            genreKeyLabel.text = "Genre:"
            genreKeyLabel.textAlignment = .left
            genreKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            genreKeyLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            genreLabel.text = genre ?? "-"
            genreLabel.textAlignment = .right
            genreLabel.numberOfLines = .zero
        }
    }
    
    var collectionName: String? {
        didSet {
            collectionNameKeyLabel.text = "Collection:"
            collectionNameKeyLabel.textAlignment = .left
            collectionNameKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            collectionNameKeyLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            collectionNameLabel.text = collectionName ?? "-"
            collectionNameLabel.textAlignment = .right
            collectionNameLabel.numberOfLines = .zero
        }
    }
    
    var contentAdvisoryRating: String? {
        didSet {
            contentAdvisoryRatingKeyLabel.text = "Content Advisory:"
            contentAdvisoryRatingKeyLabel.textAlignment = .left
            contentAdvisoryRatingKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            contentAdvisoryRatingKeyLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            contentAdvisoryRatingLabel.text = contentAdvisoryRating ?? "-"
            contentAdvisoryRatingLabel.textAlignment = .right
            contentAdvisoryRatingLabel.numberOfLines = .zero
        }
    }
    
    var userRating: String? {
        didSet {
            userRatingKeyLabel.text = "User Rating:"
            userRatingKeyLabel.textAlignment = .left
            userRatingKeyLabel.font = .boldSystemFont(ofSize: 17.0)
            userRatingKeyLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
            userRatingLabel.text = userRating ?? "-"
            userRatingLabel.textAlignment = .right
            userRatingLabel.numberOfLines = .zero
        }
    }
    
    var imageView = UIImageView()
    
    private let releaseDateKeyLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private lazy var releaseDateStackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [releaseDateKeyLabel, releaseDateLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var artistNameKeyLabel = UILabel()
    private var artistNameLabel = UILabel()
    private lazy var artistNameStackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [artistNameKeyLabel, artistNameLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var developerNameKeyLabel = UILabel()
    private var developerNameLabel = UILabel()
    private lazy var developerNameStackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [developerNameKeyLabel, developerNameLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var authorNameKeyLabel = UILabel()
    private var authorNameLabel = UILabel()
    private lazy var authorNameStackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [authorNameKeyLabel, authorNameLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var directorNameKeyLabel = UILabel()
    private var directorNameLabel = UILabel()
    private lazy var directorNameStackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [directorNameKeyLabel, directorNameLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var countryKeyLabel = UILabel()
    private var countryLabel = UILabel()
    private lazy var countryStackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [countryKeyLabel, countryLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var genresKeyLabel = UILabel()
    private var genresLabel = UILabel()
    private lazy var genresStackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [genresKeyLabel, genresLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var genreKeyLabel = UILabel()
    private var genreLabel = UILabel()
    private lazy var genreStackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [genreKeyLabel, genreLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var collectionNameKeyLabel = UILabel()
    private var collectionNameLabel = UILabel()
    private lazy var collectionNameStackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [collectionNameKeyLabel, collectionNameLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var contentAdvisoryRatingKeyLabel = UILabel()
    private var contentAdvisoryRatingLabel = UILabel()
    private lazy var contentAdvisoryRatingStackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [contentAdvisoryRatingKeyLabel, contentAdvisoryRatingLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var userRatingKeyLabel = UILabel()
    private var userRatingLabel = UILabel()
    private lazy var userRatingStackView: UIStackView? = {
        let stackView = UIStackView(arrangedSubviews: [userRatingKeyLabel, userRatingLabel])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private var media: MediaType
    
    init(media: MediaType) {
        self.media = media
        super.init(frame: .zero)
        
        backgroundColor = .systemBackground
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: .screenWidth)
        ])
        
        configureStackView(for: media)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView(for media: MediaType) /*-> UIStackView*/ {
        var stackView = UIStackView()
        switch media {
        case .podcast:
            stackView = UIStackView(
                arrangedSubviews: [
                    releaseDateStackView!,
                    artistNameStackView!,
                    countryStackView!,
                    genresStackView!
                ])
        case .music:
            stackView = UIStackView(
                arrangedSubviews: [
                    releaseDateStackView!,
                    artistNameStackView!,
                    collectionNameStackView!,
                    countryStackView!,
                    genreStackView!
            ])
        case .movie:
            stackView = UIStackView(
                arrangedSubviews: [
                    releaseDateStackView!,
                    directorNameStackView!,
                    countryStackView!,
                    genreStackView!,
                    contentAdvisoryRatingStackView!
            ])
        case .software:
            stackView = UIStackView(
                arrangedSubviews: [
                    releaseDateStackView!,
                    developerNameStackView!,
                    userRatingStackView!,
                    genresStackView!
            ])
        case .ebook:
            stackView = UIStackView(
                arrangedSubviews: [
                    releaseDateStackView!,
                    authorNameStackView!,
                    userRatingStackView!,
                    genresStackView!
            ])
        default:
            stackView = UIStackView(
                arrangedSubviews: [
                    releaseDateStackView,
                    artistNameStackView,
                    directorNameStackView,
                    developerNameStackView,
                    authorNameStackView,
                    countryStackView,
                    collectionNameStackView,
                    userRatingStackView,
                    contentAdvisoryRatingStackView,
                    genreStackView,
                    genresStackView
                ].compactMap({ $0 }))
        }
        
        stackView.axis = .vertical
        stackView.spacing = 8.0
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32.0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0)
        ])
//        return stackView
    }
}
