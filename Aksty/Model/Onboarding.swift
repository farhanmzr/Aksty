//
//  Onboarding.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 17/10/22.
//

import Foundation

struct Onboarding: Identifiable {
var id = UUID().uuidString
var title: String
var description: String
}


// Same Title and desc ...
let title = "Create Collect,\nTimeless Artworks"
let description = "Browse and build your collection of the world’s most cutting-edge digital art"
let title2 = "It’s All About\nScarity & Artworks"
let description2 = "Art is minted as an NFT and comes as limited editions, making them extremely valuable."

// Sample Model Screens ....
var onboardings: [Onboarding] = [
    Onboarding(title: title, description: description),
    Onboarding(title: title2, description: description2)
]
