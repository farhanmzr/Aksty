//
//  CreatorRow.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 28/11/22.
//

import SwiftUI

struct CreatorRow: View {
    
    @Environment(\.colorScheme) var colorScheme
    var creator: Creator
    
    var body: some View {
        
        VStack {
        
            HStack {
            
            TextView(text: creator.number, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                .padding(.trailing, 12)
            
            
            Image("img_profile")
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .padding(.trailing, 12)
            
                VStack{
                    
                    HStack{
                        TextView(text: creator.username, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            .padding(.trailing, 0)
                        Image(creator.isVerify ? "ic_verify_small" : "")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Spacer()
                        
                    }
                    
                    HStack {
                        TextView(text: creator.totalFollowers, font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.neutral300.description)
                        Spacer()
                    }
                    
                }
                
                FollowStateButton(isFollow: creator.isFollow, isSelected: creator.isFollow)
                
            
                
            
            
        }.padding(.bottom, 20)
        
        }
        
    }
}

struct CreatorRow_Previews: PreviewProvider {
    static var previews: some View {
        CreatorRow(creator: Creator(number: "1", username: "@AksaNFT", totalFollowers: "1.241", isVerify: true, isFollow: false))
    }
}

struct CreatorWithoutNumberRow: View {
    @Environment(\.colorScheme) var colorScheme
    var creator: Creator
    
    var body: some View {
        
        VStack {
        
            HStack {
            
            Image("img_profile")
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .padding(.trailing, 12)
            
                VStack{
                    
                    HStack{
                        TextView(text: creator.username, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            .padding(.trailing, 0)
                        Image(creator.isVerify ? "ic_verify_small" : "")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Spacer()
                        
                    }
                    
                    HStack {
                        TextView(text: creator.totalFollowers, font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.neutral300.description)
                        Spacer()
                    }
                    
                }
                
                FollowStateButton(isFollow: creator.isFollow, isSelected: creator.isFollow)
                
        }.padding(.bottom, 20)
        
        }
        
    }
}

struct FollowStateButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var isFollow: Bool
    @State var isSelected: Bool
    
    var body: some View {
        
        Button(action: {
            isSelected.toggle()
            isFollow.toggle()
        }) {
            HStack{
                TextView(text: isFollow ? "Unfollow" : "Follow", font: FontHelper.semibold.description, size: 16, colorHex: isSelected ? ColorHelper.neutral500.description : ColorHelper.white.description)
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 28)
            .frame(width: 120)
            .overlay(
                RoundedRectangle(cornerRadius: 28)
                    .stroke(isSelected ? Color(hex: ColorHelper.neutral200.description) : Color(hex: ColorHelper.primary500.description), lineWidth: 1.5)
            )
            .background(isSelected ? Color(hex: ColorHelper.white.description) : Color(hex: ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
        }
        
    }
}
