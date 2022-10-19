//
//  RecentViewController.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 18.10.2022.
//

import UIKit
import Kingfisher

class RecentViewController: UIViewController {

	// MARK: - Properties
	private var viewModel = RecentViewModel()
	
	// MARK: - Outlets
	@IBOutlet weak var tableView: UITableView!
	
	// MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "Recent"
		view.backgroundColor = .MyTheme.smoke
		
		viewModel.fetchPhotos()
		
		let nib = UINib(nibName: "PostTableViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: "postCell")

		// Fetch photos for table view
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
		// Implement changeHandler
		viewModel.changeHandler = { change in
			switch change {
			case .didFetchPhotos:
				self.tableView.reloadData()
				print("Photos Fetched")
			case .didErrorOccur(let error):
				self.showError(error)
			}
		}
    }
}

extension RecentViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

extension RecentViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRows
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else {
			fatalError("PostTableViewCell not found.")
		}
		guard let photo = viewModel.photoForIndexPath(indexPath) else {
			fatalError("photo not found.")
		}
		
		cell.tintColor = .MyTheme.firebrick
		cell.url = photo.photoURL
		cell.usernameLabel.text = photo.username
		cell.numberOfFavesLabel.text = (photo.faveCount ?? "0") + " favorites"
		cell.userIconImageView.makeCircular()
		cell.userIconImageView.kf.setImage(with: photo.userIconUrl) { _ in
			tableView.reloadRows(at: [indexPath], with: .automatic)
		}
		cell.photoImageView.kf.setImage(with: photo.photoURL) { _ in
			tableView.reloadRows(at: [indexPath], with: .automatic)
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return 370
	}
}

