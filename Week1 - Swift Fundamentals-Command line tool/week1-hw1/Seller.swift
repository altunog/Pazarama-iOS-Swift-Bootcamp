//
//  Seller.swift
//  week1-hw1
//
//  Created by Oğuz Kaan Altun on 23.09.2022.
//

import Foundation

protocol SaleEligbile {
    var taxNumberID: Int { get }
    var address: String { get }
    
}

class Seller: User, SaleEligbile {
    var taxNumberID: Int
    var address: String
    
    init(username: String, password: String, age: Int, gender: Gender, job: JobType, taxNumberID: Int, address: String) {
        self.taxNumberID = taxNumberID
        self.address = address
        super.init(username: username, password: password, age: age, gender: gender, job: job)
    }
}
