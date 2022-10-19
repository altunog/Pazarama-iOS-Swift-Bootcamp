//
//  FavoritesVC.swift
//  iTunes Client App
//
//  Created by Oğuz Kaan Altun on 10.10.2022.
//

import UIKit
import CoreData

class FavoritesVC: UIViewController {

	var favoritesList = [DBModel]()
    private let mainView = MainView()
    private let db = DBManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.setCollectionViewDelegate(self, andDataSource: self)
		db.fetchItems()
		for item in DBManager.favoritesList {
			self.favoritesList.append(item)
		}
        view.backgroundColor = .systemYellow
        
    }

}

extension FavoritesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = FavoritesDetailVC()
		detailVC.media = favoritesList[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension FavoritesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return favoritesList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MediaCollectionViewCell
		let media = favoritesList[indexPath.row]
		cell.title = media.mediaName
		cell.imageView.image = UIImage(data: media.artwork)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }
    
}
