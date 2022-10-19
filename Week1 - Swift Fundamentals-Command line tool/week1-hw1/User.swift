//
//  User.swift
//  week1-hw1
//
//  Created by Oğuz Kaan Altun on 23.09.2022.
//

import Foundation

class User {
    static var users = [User]()
    
    var username: String
    var password: String
    var age: Int
    var gender: Gender
    var job: JobType
    var favorites: [Pokemon] = []
    var itemsInCart: [Pokemon] = []
    var paymentMethods: [PaymentMethod] = []
    
    init(username: String, password: String, age: Int, gender: Gender, job: JobType) {
        self.username = username
        self.password = password
        self.age = age
        self.gender = gender
        self.job = job
    }
    
    func addToCart(_ selectedPokemon: Pokemon) {
        itemsInCart.append(selectedPokemon)
    }
    
    func addToFavorites(_ selectedPokemon: Pokemon) {
        favorites.append(selectedPokemon)
    }
    
    func addPaymentMethod(methodType: PaymentMethod.PaymentMethodType, methodID: Int) {
        let newPaymentMethod = PaymentMethod(methodType: methodType, methodID: methodID, balance: Float.random(in: 400...600))
        paymentMethods.append(newPaymentMethod)
    }
    
    func updateBalance(paymentMethodID: Int, amount: Float) {
        var userPaymentMethod = paymentMethods.first(where: { method in
            method.methodID == paymentMethodID
        })!
        userPaymentMethod.balance -= amount
    }
}


enum Gender: String {
    case male = "male", female = "female"
}

enum JobType: String {
    case trainer = "trainer"
    case gymLeader = "gym leader"
    case officer = "officer"
    case nurse = "nurse"
    
    static let allJobs: [JobType] = [.trainer, .gymLeader, .officer, .nurse]
}

struct PaymentMethod {
    var methodType: PaymentMethodType
    var isOnline: Bool {
        if methodType == .pokedexcard {
            return true
        } else {
            return false
        }
    }
    var methodID: Int
    var balance: Float
    
    enum PaymentMethodType: String {
        case pokedexcard
        case pokeballs
    }
}
