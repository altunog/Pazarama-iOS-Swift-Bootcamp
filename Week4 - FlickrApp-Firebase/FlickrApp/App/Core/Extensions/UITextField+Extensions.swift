//
//  UITextField+Extensions.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 16.10.2022.
//

import UIKit

extension UITextField {
		
	func makeUnderlinedTextField(using color: UIColor = UIColor.MyTheme.coal) {
		
		let bottomLine = CALayer()
		bottomLine.frame = CGRect(x: 0, y: self.frame.height - 5, width: self.frame.width, height: 1)
		bottomLine.backgroundColor = color.cgColor
		self.borderStyle = UITextField.BorderStyle.none
		self.layer.addSublayer(bottomLine)
	}
	
	func configureTextField(forPassword: Bool = false, usingPlaceholder text: String) {
		
		self.placeholder = text
		self.font = .systemFont(ofSize: 20)
		self.autocorrectionType = .no
		self.keyboardType = .default
		self.autocapitalizationType = .none
		self.isSecureTextEntry = forPassword
		self.clearButtonMode = .whileEditing
	}
	
}
