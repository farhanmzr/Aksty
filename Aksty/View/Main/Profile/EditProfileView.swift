//
//  EditProfileView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 09/02/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var userID: String = ""
    
    var body: some View {
        VStack{
            
            ZStack(alignment: .trailing){
                Image("img_profile_80")
                    .resizable()
                    .frame(width: 88, height: 88)
                
                VStack {
                    Spacer()
                    Image("ic_edit_profile")
                        .frame(alignment: .trailing)
                }
                            // Adjust the position of star and checkmark
                .offset(x: 24, y: 32)
                
            }.frame(width: 88, height: 88)
                .padding(.top, 40)
            
            VStack(alignment: .leading){
                TextView(text: "Full Name", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral200.description : ColorHelper.neutral500.description)
                    .padding(.top, 56)
                    .padding(.bottom, 4)
                
                TextField("Dewa Siwa", text: $fullName)
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
                
                TextView(text: "Chains", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 4)
                
                HStack{
                    TextView(text: "All Chains)", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    Spacer()
                    Image(colorScheme == .dark ? "ic_copy_uid_light": "ic_copy_uid")
                }
                .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 26)
                        .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                ).padding(.bottom, 24)
                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                .accentColor(Color(.gray))
            }
            
            Spacer()
            
            Button(action: {
                    
            }, label: {
                NavigationLink(destination: SettingView()){
                    TextView(text: "Save", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
                }
            })
            .padding(.bottom, 24)
            
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
