//
//  data.swift
//  week1-hw1
//
//  Created by Oğuz Kaan Altun on 24.09.2022.
//

import Foundation

// MARK: - Seller Data
let ash = Seller(username: "Ash Ketchum", password: "ash", age: 20, gender: .male, job: .trainer, taxNumberID: 1001, address: "Pallet Town, Kanto")
let proffessorOak = Seller(username: "Proffesor Oak", password: "proffesor", age: 50, gender: .male, job: .officer, taxNumberID: 1002, address: "Pallet Town, Kanto")
let misty = Seller(username: "Misty", password: "misty", age: 18, gender: .female, job: .gymLeader, taxNumberID: 1003, address: "Cerulean City, Kanto")
let brock = Seller(username: "Brock", password: "brock", age: 21, gender: .male, job: .gymLeader, taxNumberID: 1004, address: "Pewter City, Kanto")
let gary = Seller(username: "Gary Oak", password: "gary", age: 20, gender: .male, job: .trainer, taxNumberID: 1005, address: "Pallet Town, Kanto")

var sellers: [String: Seller] = [
    "ash": ash,
    "professorOak": proffessorOak,
    "misty": misty,
    "brock": brock,
    "gary": gary
]

// MARK: - Pokemon Data
let pokemons = [
    Pokemon(name: "Chansey", type: .normal, hp: 250, attack: 5, suitableJobs: [.nurse], price: 450.0, numberOfStock: 10, rating: 5, seller: sellers["misty"]!, comments: [Comment(username: "Nurse Joy", content: "Awesome pokemon! Doing great job in out hospital.")]),
    Pokemon(name: "Bulbasaur", type: .grass, hp: 45, attack: 49, suitableJobs: [.trainer, .gymLeader], price: 318.0, numberOfStock: 4, rating: 5, seller: sellers["ash"]!, comments: [Comment(username: "Gary", content: "I won many battles with a Bulbasaur")]),
    Pokemon(name: "Charmander", type: .fire, hp: 39, attack: 52, suitableJobs: [.trainer, .gymLeader], price: 309.0, numberOfStock: 5, rating: 5, seller: sellers["ash"]!, comments: [Comment(username: "Brock", content: "One true comrade!")]),
    Pokemon(name: "Growlithe", type: .fire, hp: 55, attack: 70, suitableJobs: [.officer], price: 350.0, numberOfStock: 10, rating: 5, seller: sellers["brock"]!, comments: [Comment(username: "Ash", content: "I would suggest to all officers out there!")]),
    Pokemon(name: "Squirtle", type: .water, hp: 44, attack: 48, suitableJobs: [.trainer, .officer], price: 314.0, numberOfStock: 5, rating: 4, seller: sellers["ash"]!, comments: [Comment(username: "Misty", content: "Be careful to not annoy this one!")]),
    Pokemon(name: "Lapras", type: .water, hp: 130, attack: 85, suitableJobs: [.gymLeader, .nurse, .officer], price: 535.0, numberOfStock: 1, rating: 5, seller: sellers["gary"]!, comments: [Comment(username: "Officer Jenny", content: "Definitely a life saver!")]),
    Pokemon(name: "Pikachu", type: .electric, hp: 45, attack: 80, suitableJobs: [.trainer, .gymLeader], price: 430.0, numberOfStock: 1, rating: 5, seller: sellers["ash"]!, comments: [Comment(username: "Professor Oak", content: "I would suggest to all trainers out there!")]),
    Pokemon(name: "Electrode", type: .electric, hp: 60, attack: 50, suitableJobs: [.nurse], price: 490.0, numberOfStock: 20, rating: 3, seller: sellers["brock"]!, comments: [Comment(username: "Gary", content: "Just be careful.")]),
    Pokemon(name: "Rhydon", type: .rock, hp: 105, attack: 130, suitableJobs: [.trainer, .gymLeader], price: 485.0, numberOfStock: 4, rating: 5, seller: sellers["professorOak"]!, comments: [Comment(username: "Brock", content: "Lifetime buddy.")]),
    Pokemon(name: "Pidgeot", type: .flying, hp: 83, attack: 80, suitableJobs: JobType.allJobs, price: 479.0, numberOfStock: 4, rating: 5, seller: sellers["professorOak"]!, comments: [Comment(username: "Ash", content: "I can fly!")]),
]
