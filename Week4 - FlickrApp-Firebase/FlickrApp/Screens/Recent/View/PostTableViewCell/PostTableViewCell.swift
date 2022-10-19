//
//  PostTableViewCell.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 19.10.2022.
//

import UIKit


class PostTableViewCell: UITableViewCell {
	
	var url: URL?
	
	@IBOutlet weak var userIconImageView: UIImageView!
	@IBOutlet weak var usernameLabel: UILabel!

	@IBOutlet weak var photoImageView: UIImageView!
	
	@IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var faveButton: UIButton!
	@IBOutlet weak var saveButton: UIButton!
	@IBOutlet weak var numberOfFavesLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
	
	@IBAction func faveButtonTapped(_ button: UIButton) {
		print(url!)
	}

	@IBAction func saveButtonTapped(_ button: UIButton) {
		print(url!)
	}
}
