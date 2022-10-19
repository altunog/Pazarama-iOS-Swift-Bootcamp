//
//  UIImageView+Extensions.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 19.10.2022.
//

import UIKit

extension UIImageView {
	
	func makeCircular() {
		
		layer.borderWidth = 1 // try 3
		layer.masksToBounds = false // try true
		layer.borderColor = UIColor.black.cgColor
		layer.cornerRadius = self.frame.height / 2
		clipsToBounds = true // comment out this
	}
}
