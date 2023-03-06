//
//  TopCollectionCreatorView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 28/11/22.
//

import SwiftUI

struct TopCollectionCreatorView: View {
    
    var collectionList = [
        Collection(name: "Sarafuru", number: "1", floorPrice: "3.5", price: "15,341.53", percent: "+ 71,9%", isPercentMinus: false),
        Collection(name: "AnakPunk", number: "2", floorPrice: "2.6", price: "8,341.53", percent: "- 64,1%", isPercentMinus: true),
        Collection(name: "CoolDog NFT", number: "3", floorPrice: "3.9", price: "9,131.53", percent: "+ 81,2%", isPercentMinus: false),
        Collection(name: "Wesiyowesi NFT", number: "4", floorPrice: "3.2", price: "8,128.76", percent: "+ 45,6%", isPercentMinus: false),
        Collection(name: "HooTenan NFT", number: "5", floorPrice: "3.1", price: "10,137.41", percent: "+ 54.1%", isPercentMinus: false)
      ]
    
    var creatorList = [
        Creator(number: "1", username: "@AksaNFT", totalFollowers: "1.241 followers", isVerify: true, isFollow: true),
        Creator(number: "2", username: "@HelloNFT", totalFollowers: "821 followers", isVerify: false, isFollow: false),
        Creator(number: "3", username: "@MyNFT", totalFollowers: "622 followers", isVerify: true, isFollow: true)
    ]

    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    
                    Group {
                        
                        HStack{
                            TextView(text: "Marketplace", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            Spacer()
                            Image(colorScheme == .dark ? "ic_search_light" : "ic_search_normal")
                                .padding(.trailing, 12)
                            Image("img_profile")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        }.padding(.bottom, 24)
                        
                    }
                    
                    
                    Group {
                        
                        HStack{
                            TextView(text: "Top Collections", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            Spacer()
                            TextView(text: "See All", font: FontHelper.semibold.description, size: 14, colorHex: ColorHelper.neutral300.description)
                        }.padding(.bottom, 24)
                        
                        ForEach(collectionList) { list in
                            CollectionRow(collection: list)
                        }
                        
                            
                    }
                    
                    
                    Group {
                        
                        HStack{
                            TextView(text: "Top Creators", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            Spacer()
                            TextView(text: "See All", font: FontHelper.semibold.description, size: 14, colorHex: ColorHelper.neutral300.description)
                        }.padding(.bottom, 24)
                        
                        ForEach(creatorList) { list in
                            CreatorRow(creator: list)
                        }
                            
                    }
                    
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
        
        
    }
}

struct TopCollectionCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        TopCollectionCreatorView()
    }
}
