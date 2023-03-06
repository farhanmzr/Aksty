//
//  TextView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 25/10/22.
//
import Foundation
import SwiftUI

struct TextView: View {
    
    let text: String
    let font: String
    let size: CGFloat
    let colorHex: Int
    
    init(text: String, font: String, size: CGFloat, colorHex: Int) {
        self.text = text
        self.font = font
        self.size = size
        self.colorHex = colorHex
    }
    
    var body: some View {
        Text(text)
            .font(.custom(font, size: size))
            .foregroundColor(Color(hex: colorHex))
    }
}

struct JustifiedTextView: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.textAlignment = .justified
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
