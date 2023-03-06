//
//  ContentView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 20/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        
        if isDarkMode {
            SplashScreenView().preferredColorScheme(.dark)
        } else {
            SplashScreenView().preferredColorScheme(.light)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().preferredColorScheme(.dark)
    }
}
