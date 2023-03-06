//
//  SettingView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 02/02/23.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var toggleNotif = false
    @State var isDark = false
    @State var isLight = false
    
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    
                    HStack {
                        
                        HStack{
                            
                            Image("ic_lightmode_light")
                            
                            Button(action: {
                                self.isDarkMode = false
                                self.isLight = true
                                self.isDark = false
                                UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.isDarkMode ? .dark : .light
                                
                            }, label: {
                                TextView(text: "Light Mode", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral300.description)
                            })
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 26)
                        .background(Color(hex: self.isDarkMode ? ColorHelper.neutral500.description : ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
                        
                        Spacer()
                        
                        HStack{
                            
                            Image(colorScheme == .dark ? "ic_darkmode_light" : "ic_darkmode")
                            
                            Button(action: {
                                self.isDarkMode = true
                                self.isDark = true
                                self.isLight = false
                                UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.isDarkMode ? .dark : .light
                            }, label: {
                                TextView(text: "Dark Mode", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral300.description)
                            })
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 26)
                        .background(Color(hex: self.isDarkMode ? ColorHelper.primary500.description : ColorHelper.white.description), in:RoundedRectangle(cornerRadius: 28))
                    }
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                    )
                    .padding(.bottom, 24)
                    
                    HStack{
                        TextView(text: "Edit Profile", font: FontHelper.bold.description, size: 18, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        Spacer()
                        Image(colorScheme == .dark ? "ic_arrow_right_light" : "ic_arrow_right")
                    }.padding(.bottom, 36)
                    
                    Group {
                        TextView(text: "General", font: FontHelper.semibold.description, size: 16, colorHex: ColorHelper.neutral300.description).padding(.bottom, 24)
                        
                        GeneralView(txt1: "Currency", txt2: "USD")
                            .padding(.bottom, 16)
                        
                        GeneralView(txt1: "Country", txt2: "USA")
                            .padding(.bottom, 16)
                        
                        GeneralView(txt1: "Languge", txt2: "English")
                            .padding(.bottom, 16)
                        
                        GeneralView(txt1: "Wallet", txt2: "Metamask")
                            .padding(.bottom, 24)
                    }
                    
                    
                    TextView(text: "Application", font: FontHelper.semibold.description, size: 16, colorHex: ColorHelper.neutral300.description).padding(.bottom, 24)
                    
                    HStack {
                        TextView(text: "Notification", font: FontHelper.bold.description, size: 18, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        
                        Toggle(isOn: $toggleNotif) {
                            
                        }
                        .tint(Color(hex: ColorHelper.primary500.description))
                    }.padding(.bottom, 16)
                    
                    HStack {
                        TextView(text: "App Version", font: FontHelper.bold.description, size: 18, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        Spacer()
                        TextView(text: "v.1.0.0", font: FontHelper.regular.description, size: 14, colorHex: ColorHelper.neutral300.description)
                    }.padding(.bottom, 48)
                    
                    Button(action: {
                            
                    }, label: {
                        NavigationLink(destination: LoginView()){
                            TextView(text: "Sign Out", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity)
                                .background(Color(hex: ColorHelper.error.description), in:RoundedRectangle(cornerRadius: 28))
                        }
                    })
                    
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
        .toolbar {
            ToolbarItem(placement: .principal) {
                TextView(text: "Setting", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .accessibilityAddTraits(.isHeader)
            }
        }
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
    }
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}


struct GeneralView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var txt1: String
    var txt2: String
    
    var body: some View {
        HStack {
            TextView(text: txt1, font: FontHelper.bold.description, size: 18, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
            Spacer()
            Button(action: {
                
            }, label: {
                TextView(text: txt2, font: FontHelper.bold.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral100.description : ColorHelper.neutral400.description)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 12)
                    .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral400.description : ColorHelper.neutral100.description), in:RoundedRectangle(cornerRadius: 32))
            })
            Image(colorScheme == .dark ? "ic_arrow_right_light" : "ic_arrow_right")
        }
    }
}
