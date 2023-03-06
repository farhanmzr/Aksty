//
//  CollectionRow.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 22/11/22.
//

import SwiftUI

struct CollectionRow: View {
    
    @Environment(\.colorScheme) var colorScheme
    var collection: Collection
    
    var body: some View {
        
            LazyVStack {
            
                HStack {
                
                TextView(text: collection.number, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.trailing, 12)
                
                
                Image("img_profile")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .padding(.trailing, 12)
                
                VStack{
                    
                    HStack{
                        TextView(text: collection.name, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            .padding(.trailing, 0)
                        Image("ic_verify_small")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Spacer()
                        Image(colorScheme == .dark ? "ic_eth_light" :"ic_eth")
                            .resizable()
                            .frame(width: 16, height: 16)
                        TextView(text: collection.price, font: FontHelper.semibold.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        
                        
                        }
                    
                    HStack {
                        TextView(text: "Floor Price:", font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.neutral300.description)
                            .padding(.trailing, 0)
                        Image(colorScheme == .dark ? "ic_eth_light" :"ic_eth")
                            .resizable()
                            .frame(width: 16, height: 16)
                        TextView(text: collection.floorPrice, font: FontHelper.semibold.description, size: 12, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        .padding(.trailing, 0)
                        
                        Spacer()
                        
                        TextView(text: collection.percent, font: FontHelper.semibold.description, size: 14, colorHex: collection.isPercentMinus ? ColorHelper.error.description : ColorHelper.success.description)
                        
                        }
                }
                
                
                }
            
            }.padding(.bottom, 20)
        }
    
    }


struct CollectionRow_Previews: PreviewProvider {
    static var previews: some View {
        CollectionRow(collection: Collection(name: "Crypto", number: "1", floorPrice: "3.5", price: "15.300", percent: "+72.5", isPercentMinus: false))
    }
}
