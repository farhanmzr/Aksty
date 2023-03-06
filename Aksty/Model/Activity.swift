//
//  Activity.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 23/02/23.
//

import Foundation

struct Activity: Identifiable {
    let id = UUID()
    let nameProduct: String
    let username: String
    let from: String
    let to: String
    let price: String
    let isSale: Bool
    
}
