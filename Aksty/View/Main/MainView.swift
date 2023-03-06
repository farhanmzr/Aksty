//
//  MainView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 24/10/22.
//

import SwiftUI

struct MainView: View {
    
    @State var selection = 0
    @State private var showSheet = false
    @Environment(\.colorScheme) var colorScheme
    @State private var oldSelectedItem = 1
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            HomeView().tabItem {
                if selection == 0 {
                    Image(colorScheme == .dark ? "ic_home_light" : "ic_home_active")
                } else {
                    Image("ic_home_inactive")
                }
            }.tag(0)
                                
            SearchView().tabItem {
                if selection == 1 {
                    Image(colorScheme == .dark ? "ic_navbar_search_light" :"ic_search_active")
                } else {
                    Image("ic_search_inactive")
                }
            }.tag(1)
            
            Text("").tabItem {
                if selection == 2 {
                    Image("btn_plus")
                } else {
                    Image("btn_plus")
                }
            }.tag(2)
                    
            StatisticView().tabItem {
                if selection == 3 {
                    Image(colorScheme == .dark ? "ic_statistic_light" : "ic_statistic_active")
                } else {
                    Image("ic_statistic_inactive")
                }
            }.tag(3)
            
            ProfileView().tabItem {
                if selection == 4 {
                    Image(colorScheme == .dark ? "ic_profile_light" : "ic_profile_active")
                } else {
                    Image("ic_profile_inactive")
                }
            }.tag(4)
        }
        .onChange(of: selection) {    // SwiftUI 2.0 track changes
            if 2 == selection {
                self.showSheet = true
                self.selection = self.oldSelectedItem
            } else if (showSheet == false) {
                self.oldSelectedItem = $0
            }
        }
        .sheet(isPresented: $showSheet) {
            if #available(iOS 16.0, *) {
                SheetCreateItemView()
                    .presentationDetents([.height(232)])
            } else {
                // Fallback on earlier versions
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
        

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
