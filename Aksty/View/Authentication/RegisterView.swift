//
//  RegisterView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 24/10/22.
//

import SwiftUI

struct RegisterView: View {
    
    
    @Environment(\.colorScheme) var colorScheme
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    
                    //Form
                    Group {
                        TextView(text: "Username", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral200.description : ColorHelper.neutral500.description)
                            .padding(.top, 24)
                            .padding(.bottom, 4)
                        
                        TextField("username", text: $username)
                            .font(.custom(FontHelper.medium.description, size: 14))
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
                            .overlay(
                                RoundedRectangle(cornerRadius: 26)
                                    .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                            )
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .accentColor(Color(.gray))
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.bottom, 12)
                        
                        TextView(text: "Email Address", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral200.description : ColorHelper.neutral500.description)
                            .padding(.bottom, 4)
                        
                        TextField("example@gmail.com", text: $email)
                            .font(.custom(FontHelper.medium.description, size: 14))
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
                            .overlay(
                                RoundedRectangle(cornerRadius: 26)
                                    .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                            )
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .accentColor(Color(.gray))
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.bottom, 12)
                        
                        TextView(text: "Password", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral200.description : ColorHelper.neutral500.description)
                            .padding(.bottom, 4)
                        
                        SecureTextField(text: $password)
                        
                    }
                    
                    Group {
                        
                        Button(action: {
                            
                        }, label: {
                            NavigationLink(destination: VerifyView()){
                                TextView(text: "Sign Up", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                                    .padding(.vertical, 20)
                                    .frame(maxWidth: .infinity)
                                    .background(Color(hex: ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
                            }
                        })
                        .padding([.top, .bottom], 24)
                        
                    }
                    
                    Group {
                        
                        DividerView(label: "OR")
                            .padding(.bottom, 24)
                        
                        SocialButtonLogin(image: Image("ic_google"), text: Text("Continue with Google"))
                            .padding(.bottom, 16)
                        
                        SocialButtonLogin(image: Image("ic_facebook"), text: Text("Continue with Facebook"))
                        
                    }
                    Spacer()
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                TextFooter(text: "Have an account?", text2: "Sign In", colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description, destination: LoginView())
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                TextView(text: "Sign Up", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .accessibilityAddTraits(.isHeader)
            }
        }
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
