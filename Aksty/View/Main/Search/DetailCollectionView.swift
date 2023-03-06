//
//  DetailCollectionView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 03/01/23.
//

import SwiftUI

struct DetailCollectionView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showSheet = false
    
    var offersList = [
        Offers(name: "Leonardo Davinci", expiration: "Expiration in 2 hours", bidEth: "34.2 ETH", percentBelow: "40% below"),
        Offers(name: "Leo Septimus", expiration: "Expiration in 10 hours", bidEth: "14.1 ETH", percentBelow: "8% below"),
        Offers(name: "Lydia Vetrovs", expiration: "Expiration in 24 minutes", bidEth: "5.7 ETH", percentBelow: "16% below"),
        Offers(name: "Emery Baptista", expiration: "Expiration in 10 hours", bidEth: "9.8 ETH", percentBelow: "22% below")
      ]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    
                    DetailBody()
                    
                    ForEach(offersList) { offer in
                        DetailItemRow(offers: offer)
                    }
                    
                    Spacer()
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                TextView(text: "Detail", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .accessibilityAddTraits(.isHeader)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button(role: .destructive, action: { }) {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    Button(role: .destructive, action: { }) {
                        Label("Report", systemImage: "exclamationmark.bubble")
                    }
                } label: {
                    Image(colorScheme == .dark ? "ic_more_light" : "ic_more")
                }
                .accessibilityAddTraits(.isHeader)
            }
        }
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
        
    }
}

struct DetailCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCollectionView()
    }
}

struct DetailBody: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        Group {
            
            TextView(text: "Pink Ice Cream", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description).padding([.top, .bottom], 24)
            
            HStack{
                VStack(alignment: .leading){
                    TextView(text: "Created by", font: FontHelper.semibold.description, size: 14, colorHex: ColorHelper.neutral300.description)
                    
                    HStack(spacing: 8){
                        Image("img_created")
                        
                        TextView(text: "by AnakPunk", font:FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        Image("ic_verify_small")
                    }
                }
                Spacer()
                HStack{
                    Image("ic_lovely")
                    
                    TextView(text: "28", font:FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                }
                
            }.padding(.bottom, 16)
            
            HStack{
                TextView(text: "Current Bid", font: FontHelper.semibold.description, size: 14, colorHex: ColorHelper.neutral300.description)
                Spacer()
                TextView(text: "End In", font: FontHelper.semibold.description, size: 14, colorHex: ColorHelper.neutral300.description)
            }.padding(.bottom, 4)
            
            HStack{
                
                Image(colorScheme == .dark ? "ic_eth_light" : "ic_eth")
                TextView(text: "12.9", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                Spacer()
                TextView(text: "04h : 51m : 22s", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
            }.padding(.bottom, 20)
            
            
            TextView(text: "Description", font: FontHelper.semibold.description, size: 18, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description).padding(.bottom, 12)
            
            TextView(text: "Circle Puzzle is a collection of 123 where each NFT gives you access to the most exclusive club on earth. Devoted Entrepreneurs, Artist, and Investors leveraging the power of networking.", font: FontHelper.regular.description, size: 14, colorHex: ColorHelper.neutral300.description).padding(.bottom, 20)
            
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
            
            HStack{
                TextView(text: "Offers", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                Spacer()
                TextView(text: "Latest", font: FontHelper.semibold.description, size: 18, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                Image(colorScheme == .dark ? "ic_latest_arrow_light" :"ic_latest_arrow")
            }.padding(.bottom, 20)
            
            
            
            
            
            
            
        }
    }
}
