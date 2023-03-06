//
//  SheetPlaceBidView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 08/02/23.
//

import SwiftUI

struct SheetPlaceBidView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var bid: String = ""
    
    var body: some View {
        
        NavigationView {
            
        VStack(alignment: .leading){
            
            TextView(text: "Place Bid", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                .padding(.bottom, 24)
            
            TextView(text: "Nominal Bid", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                .padding(.bottom, 12)
            
            TextField("Enter Bid...", text: $bid)
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
                .padding(.bottom, 24)
            
            Button(action: {
                
            }, label: {
                NavigationLink(destination: MainView(selection: 0)){
                    TextView(text: "Place Bid", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
                }
            })
            .padding(.bottom, 24)
            
            Spacer()
            
        }
        }.padding([.leading, .trailing], 20)
            .padding(.vertical, 24)
            .cornerRadius(32)
    }
}

struct SheetPlaceBidView_Previews: PreviewProvider {
    static var previews: some View {
        SheetPlaceBidView()
    }
}
