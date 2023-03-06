//
//  RegisterSuccessView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 27/10/22.
//

import SwiftUI

struct RegisterSuccessView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                NavigationLink(destination: MainView()) {
                    Image("ic_close")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 32)
                }
                TextView(text: "Successfully Registered", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.top, 24)
                TextView(text: "Congratulations, your account is already registered\n in this application", font: FontHelper.medium.description, size: 16, colorHex: ColorHelper.neutral300.description)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 4)
                Spacer()
                Image("il_register_success")
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
                Button(action: {
                        
                }, label: {
                    NavigationLink(destination: MainView()){
                        TextView(text: "Go to Homepage", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
                    }
                }).padding(.bottom, 24)
                
                
                
            }.padding([.leading, .trailing], 20)
        }
        .navigationBarBackButtonHidden(true)
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
    }
}

struct RegisterSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterSuccessView()
    }
}
