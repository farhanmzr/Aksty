//
//  Creator.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 28/11/22.
//

import Foundation

struct Creator: Identifiable {
    let id = UUID()
    let number: String
    let username: String
    let totalFollowers: String
    let isVerify: Bool
    let isFollow: Bool
}
