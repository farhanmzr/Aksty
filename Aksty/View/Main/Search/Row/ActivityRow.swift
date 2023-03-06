//
//  ActivityRow.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 23/02/23.
//

import SwiftUI

struct ActivityRow: View {
    
    @Environment(\.colorScheme) var colorScheme
    var activity: Activity
    
    var body: some View{
        
            VStack(alignment: .leading) {
                    
                
                HStack {
                    Image("img_profile_creator")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                        .padding(.trailing, 1)
                    
                    VStack(spacing: 8){
                        HStack{
                            TextView(text: activity.nameProduct, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            Spacer()
                            HStack{
                                TextView(text: activity.isSale ? "SALE" : "LISTING", font: FontHelper.bold.description, size: 12, colorHex: activity.isSale ? ColorHelper.information.description : ColorHelper.warning.description)
                            }
                            .padding(.vertical, 4)
                            .padding(.horizontal, 12)
                            .background(Color(hex: activity.isSale ? ColorHelper.information.description : ColorHelper.warning.description).opacity(0.2), in:RoundedRectangle(cornerRadius: 32))
                        }
                        HStack(spacing: 2) {
                            TextView(text: activity.username, font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.neutral300.description)
                            Image("ic_verify_small")
                            Spacer()
                            TextView(text: "2 minutes ago", font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.neutral300.description)
                        }
                    }
                }.padding(.bottom, 16)
                
                HStack(alignment: .center){
                    VStack(alignment: .leading, spacing: 8){
                        TextView(text: "From", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                        TextView(text: activity.from, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    }
                    Spacer()
                    Spacer()
                    VStack(alignment: .leading, spacing: 8){
                        TextView(text: "To", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                        TextView(text: activity.to, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    }
                    Spacer()
                    Spacer()
                    VStack(alignment: .leading, spacing: 8){
                        TextView(text: "Price", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                        HStack(spacing: 4){
                            Image(colorScheme == .dark ? "ic_eth_light" : "ic_eth")
                            TextView(text: activity.price, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        }
                    }
                    Spacer()
                }
            }
            .padding([.top, .bottom], 20)
            .frame(maxWidth: .infinity)
            .padding([.leading, .trailing], 20)
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
            )
            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
            .accentColor(colorScheme == .dark ? Color(.white) : Color(.gray))
            .padding(.bottom, 16)
        
    }
    
}

struct ActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        ActivityRow(activity: Activity(nameProduct: "Test", username: "Sarafuru", from: "Hendi", to: "Hendik", price: "800", isSale: true))
    }
}
