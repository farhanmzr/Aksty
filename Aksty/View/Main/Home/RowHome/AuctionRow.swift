//
//  AuctionRow.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 28/11/22.
//

import SwiftUI

struct AuctionRow: View {
    
    @Environment(\.colorScheme) var colorScheme
    var auction: Auction
    
    var body: some View{
        
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    Spacer()
                    Button(action: {
                            
                    }, label: {
                        TextView(text: "Place Bid", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 32)
                            .background(Color(hex: colorScheme == .dark ? ColorHelper.primary500.description : ColorHelper.neutral500.description), in:RoundedRectangle(cornerRadius: 28))
                    })
                    .padding(.bottom, 14)
                }
                .background(
                    Image("img_auction_1"))
                .frame(height: 240)
                .frame(maxWidth: .infinity)
                .padding(.bottom, 16)
                        
                TextView(text: auction.title, font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 8)
                    .padding([.leading, .trailing], 16)
                
                HStack{
                    TextView(text: "Current Bid", font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.neutral300.description)
                    Spacer()
                    TextView(text: "End in", font: FontHelper.bold.description, size: 12, colorHex: ColorHelper.neutral300.description)
                }
                .padding(.bottom, 4)
                .padding([.leading, .trailing], 16)
                
                HStack{
                    Image(colorScheme == .dark ? "ic_eth_light" :"ic_eth")
                        .resizable()
                        .frame(width: 16, height: 16)
                    TextView(text: auction.currentBid, font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    Spacer()
                    TextView(text: auction.endIn, font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                }
                .padding([.leading, .trailing], 16)
                
            }
            .padding([.top, .bottom], 16)
            .frame(width: 272)
            .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
            .cornerRadius(16)
            .shadow(color: .gray.opacity(0.5), radius: 4)
        
    }
    
}
        

struct AuctionRow_Previews: PreviewProvider {
    static var previews: some View {
        AuctionRow(auction: Auction(id: 1, title: "The Cube 021", currentBid: "15.2", endIn: "03h : 23m : 15s"))
    }
}


