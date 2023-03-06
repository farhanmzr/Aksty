//
//  DividerView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 24/10/22.
//

import Foundation
import SwiftUI

struct DividerView: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
            self.label = label
               self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }
    }
}
