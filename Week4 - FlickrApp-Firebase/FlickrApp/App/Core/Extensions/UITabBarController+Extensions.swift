//
//  UITabBarController+Extensions.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 18.10.2022.
//

import UIKit

extension UITabBarController {
	
	func configureTabBarAppearance() {
		
		setViewControllers(viewControllers, animated: true)
		tabBar.itemPositioning = .centered
		tabBar.backgroundColor = .MyTheme.smoke.withAlphaComponent(0.8)
		tabBar.tintColor = .MyTheme.firebrick
		modalPresentationStyle = .fullScreen
	}
}
