//
//  ProfileViewController.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 18.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {


	@IBOutlet weak var userIconImageView: UIImageView!
	@IBOutlet weak var usernameLabel: UILabel!
	
	@IBOutlet weak var segmentedControl: UISegmentedControl!
	
	@IBOutlet weak var collectionView: UICollectionView!
	override func viewDidLoad() {
        super.viewDidLoad()

		title = "Profile"
		view.backgroundColor = .MyTheme.smoke
    }

}
