//
//  Offers.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 01/02/23.
//

import Foundation

struct Offers: Identifiable {
    let id = UUID()
    let name: String
    let expiration: String
    let bidEth: String
    let percentBelow: String
}
