//
//  Pokemon.swift
//  week1-hw1
//
//  Created by Oğuz Kaan Altun on 23.09.2022.
//

import Foundation

protocol Sellable {
    var price: Float { get }
    var numberOfStock: Int { get }
    var isInStock: Bool { get }
    
}

class Pokemon: Sellable {
    var name: String
    var type: PokemonType
    var hp: Int
    var attack: Int
    var suitableJobs: [JobType]
    var price: Float
    var numberOfStock: Int
    var isInStock: Bool { numberOfStock > 0 }
    var rating: Int
    var comments: [Comment]
    var seller: Seller
    
    init(name: String, type: PokemonType, hp: Int, attack: Int, suitableJobs: [JobType], price: Float, numberOfStock: Int, rating: Int, seller: Seller, comments: [Comment] = []) {
        self.name = name
        self.type = type
        self.hp = hp
        self.attack = attack
        self.suitableJobs = suitableJobs
        self.price = price
        self.numberOfStock = numberOfStock
        self.rating = rating
        self.seller = seller
        self.comments = comments
    }
    
    func updateSoldPokemonStock() {
        numberOfStock -= 1
    }
}


enum PokemonType: String {
    case normal
    case grass
    case fire
    case water
    case electric
    case rock
    case flying
}

struct Comment {
    var username: String
    var content: String
}
