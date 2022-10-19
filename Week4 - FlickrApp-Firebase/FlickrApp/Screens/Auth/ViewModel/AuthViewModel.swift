//
//  AuthViewModel.swift
//  FlickrApp
//
//  Created by Oğuz Kaan Altun on 16.10.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseRemoteConfigSwift

enum AuthViewModelChanges {
	case didErrorOccur(_ error: Error)
	case didSignUpSuccesful
}

final class AuthViewModel {

	var changeHandler: ((AuthViewModelChanges) -> Void)? = nil
	
	private let db = Firestore.firestore()
	
	func checkUsernameAvailable(_ username: String, completion: @escaping (Bool) -> Void) {
		let usersRef = db.collection("users")
		let query = usersRef.whereField("username", isEqualTo: username)
		query.getDocuments { querySnaphot, error in
			if let error = error {
				self.changeHandler?(.didErrorOccur(error))
			} else {
				guard let snapshot = querySnaphot else {
					print("query snapshot error")
					return
				}
				completion(snapshot.isEmpty)
			}
		}
	}
	
	func signUp(username: String, email: String, password: String) {
		Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
			if let error = error {
				self.changeHandler?(.didErrorOccur(error))
				return
			} else {
				
				guard let userId = authResult?.user.uid else {
					print("userId could not be set")
					return
				}
				
				print(userId)
				
				let user = User(
					username: username,
					email: authResult?.user.email,
					profilePhoto: "",
					likedPhotos: [],
					savedPhotos: []
				)
				
				print(user)
				let userAsEncoded = user.dictionaryV2
				print(userAsEncoded)
				
				self.db.collection("users").document(userId) .setData(userAsEncoded) { error in
					if let error = error {
						self.changeHandler?(.didErrorOccur(error))
					} else {
						self.changeHandler?(.didSignUpSuccesful)
					}
				}
			}
		}
	}
	
	func signIn(email: String, password: String, completion: @escaping () -> Void) {
		Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
			if let error = error {
				self.changeHandler?(.didErrorOccur(error))
			} else {
				completion()
			}
		}
	}
	
	
	func updateUserDisplayName(with username: String) {
		guard let user = Auth.auth().currentUser else { return }
		let changeRequest = user.createProfileChangeRequest()
		changeRequest.displayName = username
		changeRequest.commitChanges { error in
			if let error = error {
				self.changeHandler?(.didErrorOccur(error))
				return
			} else {
				print(user.displayName ?? "username not set")
			}
		}
	}
	
}
