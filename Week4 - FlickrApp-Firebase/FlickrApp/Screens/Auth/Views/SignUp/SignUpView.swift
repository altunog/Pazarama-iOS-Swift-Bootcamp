//
//  SignUpView.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 16.10.2022.
//

import UIKit


protocol SignUpViewDelegate: AnyObject {
	func signUpView(_ view: SignUpView, didTapSignUpButton button: UIButton)
	func signUpView(_ view: SignUpView, didTapCancelButton button: UIButton)
}

class SignUpView: UIView {
	
	// MARK: - Properties
	weak var delegate: SignUpViewDelegate?
	
	// MARK: - Properties for UI Constraints
	private let offset 			= 12
	private let leading			= 50
	private let buttonHeight 	= 48
	private let fieldHeight 	= 52
	
	// MARK: - UI Elements
	private lazy var cancelButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Cancel", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 17)
		button.setTitleColor(.MyTheme.firebrick, for: .normal)
		button.backgroundColor = .none
		button.addTarget(self,
						 action: #selector(didTapCancelButton(_:)),
						 for: .touchUpInside)
		return button
	}()
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Sign Up"
		label.font = .systemFont(ofSize: 48, weight: .light)
		label.textColor = .black
		return label
	}()
	
	private(set) lazy var usernameField: UITextField = {
		let textField = UITextField()
		textField.configureTextField(usingPlaceholder: "enter a username")
		return textField
	}()
	
	private(set) lazy var emailField: UITextField = {
		let textField = UITextField()
		textField.configureTextField(usingPlaceholder: "enter your email")
		return textField
	}()
	
	private(set) lazy var passwordField: UITextField = {
		let textField = UITextField()
		textField.configureTextField(forPassword: true, usingPlaceholder: "choose a password")
		return textField
	}()
	
	private(set) lazy var confirmPasswordField: UITextField = {
		let textField = UITextField()
		textField.configureTextField(forPassword: true, usingPlaceholder: "confirm password")
		return textField
	}()
	
	private lazy var signUpButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Sign Up", for: .normal)
		button.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
		button.setTitleColor(.MyTheme.smoke, for: .normal)
		button.backgroundColor = .MyTheme.firebrick
		button.layer.cornerRadius = 8
		button.addTarget(self,
						 action: #selector(didTapSignUpButton(_:)),
						 for: .touchUpInside)
		return button
	}()

	// MARK: - Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .MyTheme.smoke
		
		setupCancelButton()
		setupTitleLabel()
		setupEmailFieldLayout()
		setupPasswordFieldLayout()
		setupUsernameFieldLayout()
		setupPasswordConfirmFieldLayout()
		setupSignUpButtonLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Methods for Constraints
	private func setupCancelButton() {
		addSubview(cancelButton)
		cancelButton.snp.makeConstraints { make in
			make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
			make.leading.equalTo(16)
		}
	}
	
	private func setupTitleLabel() {
		addSubview(titleLabel)
		titleLabel.snp.makeConstraints { make in
			make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(90)
			make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
		}
	}
	
	private func setupUsernameFieldLayout() {
		addSubview(usernameField)
		usernameField.snp.makeConstraints { make in
			make.height.equalTo(fieldHeight)
			make.bottom.equalTo(emailField.snp.top).offset(-1*offset)
			make.leading.equalTo(leading)
			make.trailing.equalTo(-1*leading)
		}
	}
	
	private func setupEmailFieldLayout() {
		addSubview(emailField)
		emailField.snp.makeConstraints { make in
			make.height.equalTo(fieldHeight)
			make.bottom.equalTo(safeAreaLayoutGuide.snp.centerY).offset(-1*offset/2)
			make.leading.equalTo(leading)
			make.trailing.equalTo(-1*leading)
		}
	}
	
	private func setupPasswordFieldLayout() {
		addSubview(passwordField)
		passwordField.snp.makeConstraints { make in
			make.height.equalTo(fieldHeight)
			make.top.equalTo(safeAreaLayoutGuide.snp.centerY).offset(offset/2)
			make.leading.equalTo(leading)
			make.trailing.equalTo(-1*leading)
		}
	}
	
	private func setupPasswordConfirmFieldLayout() {
		addSubview(confirmPasswordField)
		confirmPasswordField.snp.makeConstraints { make in
			make.height.equalTo(fieldHeight)
			make.top.equalTo(passwordField.snp.bottom).offset(offset)
			make.leading.equalTo(leading)
			make.trailing.equalTo(-1*leading)
		}
	}
	
	private func setupSignUpButtonLayout() {
		addSubview(signUpButton)
		signUpButton.snp.makeConstraints { make in
			make.height.equalTo(buttonHeight)
			make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-70)
			make.leading.equalTo(leading)
			make.trailing.equalTo(-1*leading)
		}
	}
	
	// MARK: - Delegate Methods
	@objc private func didTapSignUpButton(_ button: UIButton) {
		delegate?.signUpView(self, didTapSignUpButton: button)
	}
	
	@objc private func didTapCancelButton(_ button: UIButton) {
		delegate?.signUpView(self, didTapCancelButton: button)
	}
}
