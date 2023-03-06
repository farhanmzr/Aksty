//
//  ExploreCreatorRow.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 09/02/23.
//

import SwiftUI

struct ExploreCreatorRow: View {
    
    @Environment(\.colorScheme) var colorScheme
    var exploreCreator: ExploreCreator
    
    var body: some View{
        
            VStack(alignment: .leading) {
                    
                VStack{
                    
                }
                .background(Image("img_explore_creator"))
                .frame(maxWidth: .infinity)
                .frame(height: 104)
                .cornerRadius(8)
                .padding(.bottom, 16)
                
                HStack {
                    Image("img_profile_creator")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                        .padding(.trailing, 1)
                    
                    VStack(spacing: 4){
                        HStack{
                            TextView(text: exploreCreator.name, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                                .padding(.trailing, 0)
                            Spacer()
                        }
                        HStack(spacing: 2) {
                            TextView(text: "by", font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.neutral300.description)
                            TextView(text: exploreCreator.username, font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.primary500.description)
                            Spacer()
                        }
                    }
                }.padding(.bottom, 16)
                
                HStack(alignment: .center){
                    
                    VStack(alignment: .center, spacing: 8){
                        TextView(text: "Collections", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                        TextView(text: exploreCreator.totalCollection, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    }
                    Spacer()
                    Spacer()
                    VStack(alignment: .center, spacing: 8){
                        TextView(text: "Owner", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                        TextView(text: exploreCreator.totalOwner, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    }
                    Spacer()
                    Spacer()
                    VStack(alignment: .center, spacing: 8){
                        TextView(text: "Floor Price", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                        HStack(spacing: 4){
                            Image(colorScheme == .dark ? "ic_eth_light" : "ic_eth")
                            TextView(text: exploreCreator.floorPrice, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        }
                    }
                }
                .padding(.bottom, 16)
                
                HStack(alignment: .center){
                    
                    Image("img_creator_1")
                    
                    Spacer()
                
                    Image("img_creator_2")
                    Spacer()
                    
                    ZStack{
                        Image("img_creator_3")
                        TextView(text: exploreCreator.totalPicture, font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                    }
                }
                        
                
                
            }
            .padding([.top, .bottom], 20)
            .frame(maxWidth: .infinity)
            .padding([.leading, .trailing], 20)
            .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.5), radius: 4)
        
    }
    
}

struct ExploreCreatorRow_Previews: PreviewProvider {
    static var previews: some View {
        ExploreCreatorRow(exploreCreator: ExploreCreator(name: "Test", username: "Sarafuru", totalCollection: "752", totalOwner: "502K", floorPrice: "72.5ETH", totalPicture: "+604"))
    }
}
