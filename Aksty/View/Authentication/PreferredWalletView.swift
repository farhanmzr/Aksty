//
//  PreferredWalletView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 27/10/22.
//

import SwiftUI

struct PreferredWalletView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                TextView(text: "Lets choose your prefered\nwallet!", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.top, 48)
                TextView(text: "Please choose your prefered wallet to use\nwhen you do transaction.", font: FontHelper.medium.description, size: 16, colorHex: ColorHelper.neutral300.description)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 4)
                    .padding(.bottom, 32)
                
                Group {
                    VStack(spacing: 16){
                        ChoicesWalletView(imgWallet: "ic_metamask", text: "Metamask", isSelected: true)
                        
                        ChoicesWalletView(imgWallet: "ic_coinbase", text: "Coinbase", isSelected: false)
                        
                        ChoicesWalletView(imgWallet: "ic_wallet", text: "Wallet Connect", isSelected: false)
                        
                        ChoicesWalletView(imgWallet: "ic_formatic", text: "Formatic", isSelected: false)
                    }
                }
                
                Spacer()
                
                Button(action: {
                        
                }, label: {
                    NavigationLink(destination: RegisterSuccessView()){
                        TextView(text: "Connect Wallet", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
                    }
                }).padding(.bottom, 24)
                
                ZStack {
                    NavigationLink(destination: MainView()){
                        TextView(text: "Skip for now", font: FontHelper.medium.description, size: 14, colorHex: ColorHelper.neutral300.description)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom, 24)
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
    }
}

struct PreferredWalletView_Previews: PreviewProvider {
    static var previews: some View {
        PreferredWalletView()
    }
}

struct ChoicesWalletView: View {
    
    @Environment(\.colorScheme) var colorScheme
//    var image: Image
    var imgWallet: String
    var text: String
    @State var isSelected: Bool
    
    var body: some View {
        
        Button(action: {
            isSelected.toggle()
        }) {
            HStack{
                Image(imgWallet)
                VStack(alignment: .leading){
                    TextView(text: text, font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                }.padding(.leading, 12)
                Spacer()
                Image(colorScheme == .dark ? isSelected ? "rb_active_light" : "rb_inactive_light" : isSelected ? "rb_active" : "rb_inactive")
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 36)
                    .stroke(isSelected ? Color(hex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description) : Color(hex: colorScheme == .dark ? ColorHelper.neutral100.description : ColorHelper.neutral100.description), lineWidth: 1.5)
            )
        }
        
    }
}
