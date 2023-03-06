//
//  FontHelper.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 25/10/22.
//

import Foundation

enum FontHelper {

    case extraBold
    case bold
    case light
    case medium
    case regular
    case semibold
    
    var description: String{
        switch self {
        case .extraBold:
            return "Urbanist-ExtraBold"
        case .bold:
            return "Urbanist-Bold"
        case .light:
            return "Urbanist-Light"
        case .medium:
            return "Urbanist-Medium"
        case .regular:
            return "Urbanist-Regular"
        case .semibold:
            return "Urbanist-SemiBold"
        }
    }
    
}
