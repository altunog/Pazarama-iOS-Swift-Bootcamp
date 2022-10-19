//
//  SignInViewController.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 13.10.2022.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
//	go back to root view at sign out
//	self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
//https://stackoverflow.com/questions/47322379/swift-how-to-dismiss-all-of-view-controllers-to-go-back-to-root
	
	
	// MARK: - Properties
	private let viewModel = AuthViewModel()
	
	var email: String {
		emailField.text ?? ""
	}
	
	var password: String {
		passwordField.text ?? ""
	}
	
	// MARK: - Outlets
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	@IBOutlet weak var signInButton: UIButton!
	@IBOutlet weak var signUpTextButton: UIButton!
	
	// MARK: - Inits
//	init(viewModel: AuthViewModel) {
//		self.viewModel = viewModel
//		super.init(nibName: nil, bundle: nil)
//	}
//
//	required init?(coder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
		
		viewModel.changeHandler = { change in
			switch change {
			case .didErrorOccur(let error):
				self.showError(error)
			default:
				print("signed in")
			}
		}
		
		emailField.makeUnderlinedTextField()
		passwordField.makeUnderlinedTextField()
		signInButton.layer.cornerRadius = 8
    }
	
	@IBAction func signUpTextButtonTapped(_ button: UIButton) {
		let signUpVC = SignUpViewController()
		present(signUpVC, animated: true)
	}
	
	@IBAction func signInButtonTapped(_ button: UIButton) {
		viewModel.signIn(email: email, password: password) { [weak self] in
			guard let self = self else { return }
			let viewControllers = self.setupViewControllers()
			let tabBarController = UITabBarController()
			tabBarController.setViewControllers(viewControllers, animated: false)
			tabBarController.configureTabBarAppearance()

			self.present(tabBarController, animated: true)
		}
	}
	
	private func setupViewControllers() -> [UINavigationController] {
		let recentVC = UINavigationController(rootViewController: RecentViewController())
		let searchVC = UINavigationController(rootViewController: SearchViewController())
		let profileVC = UINavigationController(rootViewController: ProfileViewController())
		
		recentVC.title = "Recent"
		recentVC.tabBarItem = UITabBarItem(title: "",
										   image: UIImage(named: "house"),
										   selectedImage: UIImage(named: "housefill"))

		searchVC.title = "Search"
		searchVC.tabBarItem = UITabBarItem(title: "",
										   image: UIImage(named: "magnifyingglass"),
										   selectedImage: UIImage(named: "magnifyingglassfill"))
		
		profileVC.title = "Profile"
		profileVC.tabBarItem = UITabBarItem(title: "",
										   image: UIImage(named: "person"),
										   selectedImage: UIImage(named: "personfill"))
		

		return [recentVC, searchVC, profileVC]
	}
}

