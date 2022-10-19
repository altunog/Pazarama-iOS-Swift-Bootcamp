//
//  SearchCell.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 19.10.2022.
//

import UIKit

class SearchCell: UICollectionViewCell {
    static let identifier = "SearchCell"
	
	var url: URL?
	
	let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "person")
		imageView.backgroundColor = .MyTheme.smoke
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		imageView.frame = CGRect(x: 0,
								 y: 0,
								 width: contentView.frame.size.width,
								 height: contentView.frame.size.height)
	}

	private func configure() {
		contentView.addSubview(imageView)
//		imageView.snp.makeConstraints { make in
//			make.top.equalTo(contentView.snp.top)
//			make.leading.equalTo(contentView.snp.leading)
//			make.trailing.equalTo(contentView.snp.trailing)
//			make.height.equalTo(imageView.snp.width)
//		}
	}
	
}
