//
//  AlertPresentable.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 16.10.2022.
//

import UIKit

protocol AlertPresentable { }

extension AlertPresentable where Self: UIViewController {
	func showAlert(title: String? = nil,
				   message: String? = nil,
				   hasCancelOption: Bool = false,
				   handler: ((UIAlertAction) -> Void)? = nil) {
		let alertController = UIAlertController(title: title,
												message: message,
												preferredStyle: .alert)
		let defaultAction = UIAlertAction(title: "OK",
										  style: .default,
										  handler: handler)
		
		if let handler = handler, hasCancelOption {
			let cancelAction = UIAlertAction(title: "Cancel",
											 style: .cancel,
											 handler: handler)
			alertController.addAction(cancelAction)
		}
		alertController.addAction(defaultAction)
		present(alertController, animated: true)
	}
	
	func showError(_ error: Error) {
		showAlert(title: "Error Occured",
				  message: error.localizedDescription)
	}
}
