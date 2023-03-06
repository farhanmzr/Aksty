//
//  VerifyView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 25/10/22.
//

import SwiftUI

struct VerifyView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var showingAlert = false
    @State private var navLinkActive = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack(alignment: .center) {
                    
                    Group {
                        
                        Image(colorScheme == .dark ? "ic_verify_light" : "ic_verify")
                            .padding(.top, 48)
                        
                        TextView(text: "Verify Your Identity", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            .padding(.top, 40)
                        
                        TextView(text: "To help you protect from fraud and identity theft, and to comply with federal regulations.", font: FontHelper.medium.description, size: 14, colorHex: ColorHelper.neutral300.description)
                            .padding(.top, 12)
                            .multilineTextAlignment(.center)
                            .padding(.leading, 24)
                            .padding(.trailing, 24)
                        
                    }
                    
                    Group {
                        
                        ChoicesView(activeImg: colorScheme == .dark ? "ic_email_light" : "ic_email_active", inactiveImg: colorScheme == .dark ? "ic_email_light" : "ic_email_inactive", text: "Email", desc: "Verify with email", isSelected: true)
                            .padding(.top, 40)
                        
                        ChoicesView(activeImg: colorScheme == .dark ? "ic_phone_light" : "ic_phone_active", inactiveImg: colorScheme == .dark ? "ic_phone_light" : "ic_phone_inactive", text: "Phone Number", desc: "Verify with phone number", isSelected: false)
                            .padding(.top, 24)
                    }
                    
                    Spacer()
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
                
                Button(action: {
                    showingAlert = true
                }, label: {
                    TextView(text: "Continue", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
                })
                .padding(.bottom, 16)
                .padding([.leading, .trailing], 20)
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Check Your Email"), message: Text("We already a link to your email to set your PIN"),
                          dismissButton: .default(Text("Got It")){
                        navLinkActive = true
                    })
                }
                NavigationLink(isActive: $navLinkActive, destination: { OTPView(OTPData: OTPDataModel.init(), isSelected: true) }, label: {
                    EmptyView()
                })
            }
        }
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
    }
}

struct VerifyView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyView()
    }
}

struct ChoicesView: View {
    
    @Environment(\.colorScheme) var colorScheme
//    var image: Image
    var activeImg: String
    var inactiveImg: String
    var text: String
    var desc: String
    @State var isSelected: Bool
    
    var body: some View {
        
        Button(action: {
            isSelected.toggle()
        }) {
            HStack{
                Image(isSelected ? activeImg : inactiveImg)
                VStack(alignment: .leading, spacing: 4){
                    TextView(text: text, font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    TextView(text: desc, font: FontHelper.regular.description, size: 12, colorHex: ColorHelper.neutral300.description)
                }.padding(.leading, 12)
                Spacer()
                Image(colorScheme == .dark ? isSelected ? "rb_active_light" : "rb_inactive_light" : isSelected ? "rb_active" : "rb_inactive")
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 36)
                    .stroke(isSelected ? Color(hex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.primary500.description) : Color(hex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral100.description), lineWidth: 1.5)
            )
        }
        
    }
}
