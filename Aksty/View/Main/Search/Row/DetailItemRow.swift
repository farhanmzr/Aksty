//
//  DetailItemRow.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 01/02/23.
//

import SwiftUI

struct DetailItemRow: View {
    
    @Environment(\.colorScheme) var colorScheme
    var offers: Offers
    
    var body: some View {
        
        HStack{
            
            Image("img_profile")
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .padding(.trailing, 6)
            
            VStack (alignment: .leading){
                TextView(text: offers.name, font: FontHelper.semibold.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description).padding(.bottom, 4)
                
                TextView(text: offers.expiration, font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.neutral300.description)
            }
            
            Spacer()
            
            VStack{
                TextView(text: offers.bidEth, font: FontHelper.bold.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral300.description).padding(.bottom, 4)
                
                
                TextView(text: offers.percentBelow, font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.neutral300.description)
            }
            
        }.padding(.bottom, 12)
        
    }
}

struct DetailItemRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailItemRow(offers: Offers(name: "Nama", expiration: "Expiration", bidEth: "13 ETH", percentBelow: "12% Below"))
    }
}
