//
//  ColorHelper.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 25/10/22.
//

import Foundation


enum ColorHelper {

    case primary500
    case primary400
    case primary300
    case primary200
    case primary100
    case neutral500
    case neutral400
    case neutral300
    case neutral200
    case neutral100
    case success
    case warning
    case error
    case information
    case white
    case bgProfile
    case bgBorder
    
    var description: Int{
        switch self {
        case .primary500:
            return 0x2563EB
        case .primary400:
            return 0x598EF3
        case .primary300:
            return 0x7BAAF9
        case .primary200:
            return 0xA7CAFD
        case .primary100:
            return 0xD3E6FE
        case .neutral500:
            return 0x2C3131
        case .neutral400:
            return 0x626262
        case .neutral300:
            return 0xA9A9A9
        case .neutral200:
            return 0xCACACA
        case .neutral100:
            return 0xE9E9E9
        case .success:
            return 0x53D258
        case .warning:
            return 0xE4C65B
        case .error:
            return 0xE25C5C
        case .information:
            return 0x2685CA
        case .white:
            return 0xFFFFFF
        case .bgProfile:
            return 0x333333
        case .bgBorder:
            return 0xFAFAFA
        }
    }
    
}
