//
//  SignUpViewController.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 16.10.2022.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {
	
	// MARK: - Propterty for ViewModel
	private let viewModel = AuthViewModel()
	
	// MARK: Property for View
	private lazy var signUpView: SignUpView = {
		let view = SignUpView()
		view.delegate = self
		return view
	}()
	
	// MARK: Properties (Gettable only)
	var username: String {
		signUpView.usernameField.text ?? ""
	}
	
	var email: String {
		signUpView.emailField.text ?? ""
	}
	
	var password: String {
		signUpView.passwordField.text ?? ""
	}
	
	var confirmPassword: String {
		signUpView.confirmPasswordField.text ?? ""
	}
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		viewModel.changeHandler = { change in
			switch change {
			case .didErrorOccur(let error):
				self.showError(error)
			case .didSignUpSuccesful:
				self.showAlert(title: "Signed up succesfully!",
							   message: "You can sign in now.") { _ in
					self.dismiss(animated: true)
				}
			}
		}
		
		view = signUpView
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		signUpView.usernameField.makeUnderlinedTextField()
		signUpView.emailField.makeUnderlinedTextField()
		signUpView.passwordField.makeUnderlinedTextField()
		signUpView.confirmPasswordField.makeUnderlinedTextField()
	}
	
	// MARK: - Methods
	private func checkEmptyFieldsExist() -> Bool {
		guard username != "",
			  !username.contains(" ") else { return true }
		guard email != "",
			  !email.contains(" ") else { return true }
		guard password != "",
			  !password.contains(" ") else { return true }
		guard confirmPassword != "",
			  !confirmPassword.contains(" ") else { return true }
		return false
	}
	
	private func checkPasswordNotMatch() -> Bool {
		return password != confirmPassword
	}

	
}

extension SignUpViewController: SignUpViewDelegate {
	func signUpView(_ view: SignUpView, didTapSignUpButton button: UIButton) {
		print("sign up tapped")
		if checkEmptyFieldsExist() {
			showAlert(title: "Invalid Input(s)", message: "Please fill out all fields correctly.")
			return
		}
		
		if checkPasswordNotMatch() {
			showAlert(title: "Confirm Password", message: "Please make sure your passwords match.")
			return
		}
		
		viewModel.checkUsernameAvailable(username) { isAvailable in
			if isAvailable {
				self.viewModel.signUp(username: self.username,
									  email: self.email,
									  password: self.password)
			} else {
				self.showAlert(title: "Username already taken", message: "Please try another one.")
			}
		}
	}
	
	func signUpView(_ view: SignUpView, didTapCancelButton button: UIButton) {
		print("cancel tapped")
		dismiss(animated: true)
	}
}
