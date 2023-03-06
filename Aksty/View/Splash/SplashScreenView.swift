//
//  SplashScreenView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 08/02/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State var isActive: Bool = false
    
    var body: some View {
        
        ZStack {
            if self.isActive {
                //Getting Screensize globally
                GeometryReader{proxy in
                    let size = proxy.size
                    OnboardingView(screenSize: size)
                }
            } else {
                VStack(alignment: .center) {
                    Image(colorScheme == .dark ? "logo_dark" : "logo")
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color(hex: self.isDarkMode ? ColorHelper.neutral500.description : ColorHelper.white.description))
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
