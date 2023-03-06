//
//  PreviewCreateItemView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 06/02/23.
//

import SwiftUI

struct PreviewCreateItemView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading){
            
            Group {
                
                Image("img_upload")
                    .resizable()
                    .frame(height: 340)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 24)
                
                TextView(text: "Circle Puzzle", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 16)
                
                HStack {
                    
                    TextView(text: "Reserve Price", font: FontHelper.regular.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    Spacer()
                    Image(colorScheme == .dark ? "ic_eth_light": "ic_eth")
                    TextView(text: "2.54 ETH", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                }.padding(.bottom, 8)
                
                HStack {
                    
                    TextView(text: "Sales End", font: FontHelper.regular.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    Spacer()
                    TextView(text: "August 5, 2022", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                }.padding(.bottom, 24)
                
                TextView(text: "Description", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 12)
                
                TextView(text: "Circle Puzzle is a collection of 123 where each NFT gives you access to the most exclusive club on earth. Devoted Entrepreneurs, Artist, and Investors leveraging the power of networking.", font: FontHelper.regular.description, size: 14, colorHex: ColorHelper.neutral300.description).padding(.bottom, 20)
                
                               
            }
            
            Spacer()

            
        }.padding([.leading, .trailing], 20)
            .padding(.top, 24)
            .cornerRadius(32)
        
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
        .toolbar {
            ToolbarItem(placement: .principal) {
                TextView(text: "Preview", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .accessibilityAddTraits(.isHeader)
            }
        }
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
    }
}

struct PreviewCreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewCreateItemView()
    }
}
