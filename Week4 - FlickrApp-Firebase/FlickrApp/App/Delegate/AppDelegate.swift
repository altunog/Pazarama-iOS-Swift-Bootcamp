//
//  AppDelegate.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 13.10.2022.
//

import UIKit
import SnapKit
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		FirebaseApp.configure()
		let _ = Firestore.firestore()
		setupWindow()
		
		return true
	}

	fileprivate func setupWindow() {
		let window = UIWindow(frame: UIScreen.main.bounds)
		let viewController = SignInViewController()
//		let navigationController = UINavigationController(rootViewController: viewController)
		window.rootViewController = viewController
		window.makeKeyAndVisible()
		self.window = window
	}
	
}

