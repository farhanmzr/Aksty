//
//  Collection.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 22/11/22.
//

import Foundation

struct Collection: Identifiable {
    let id = UUID()
    let name: String
    let number: String
    let floorPrice: String
    let price: String
    let percent: String
    let isPercentMinus: Bool
}
