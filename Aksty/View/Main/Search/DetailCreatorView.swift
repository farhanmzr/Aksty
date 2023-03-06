//
//  DetailCreatorView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 09/02/23.
//

import SwiftUI
import SlidingTabView

struct DetailCreatorView: View {
    
    var activity = [
        Activity(nameProduct: "Black Hole #015", username: "Sarafuru", from: "Tonosu", to: "Bedilndase", price: "0.0021", isSale: true),
        Activity(nameProduct: "Busy Circle #1122", username: "AnakPunk", from: "Wachidun", to: "PakPolisi", price: "0.0085", isSale: false),
        Activity(nameProduct: "One Slise #521", username: "BoredApe", from: "Panjolcem", to: "Cemanii", price: "0.0032", isSale: true)
    ]
    
    @Environment(\.colorScheme) var colorScheme
    @State var selectedTabIndex = 0
    @StateObject var store = Store()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                
                ZStack {
                    
                    Image(colorScheme == .dark ? "img_explore_creator_light" : "img_explore_creator")
                        .resizable()
                        .frame(width: .infinity)
                    
                    HStack{
                        
                        Image("img_profile_creator")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                            .padding(.trailing, 1)
                        
                        VStack(alignment: .leading, spacing: 4){
                            TextView(text: "The Circle of Mind", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            
                            HStack(spacing: 2) {
                                TextView(text: "by", font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.neutral300.description)
                                TextView(text: "Sarafuru", font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.primary500.description)
                                Spacer()
                            }
                        }
                        Spacer()
                        Image(colorScheme == .dark ? "ic_archive_light" : "ic_archive")
                    }
                    .padding([.top, .bottom], 20)
                    .frame(maxWidth: .infinity)
                    .padding([.leading, .trailing], 20)
                    .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
                    .cornerRadius(16)
                    .padding(.horizontal, 20)
                    .offset(x: 0, y: 40)
                }
                
                VStack(alignment: .leading) {
                    
                    HStack(alignment: .center){
                        
                        VStack(alignment: .center, spacing: 8){
                            TextView(text: "Collections", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                            TextView(text: "765", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        }
                        Spacer()
                        Spacer()
                        VStack(alignment: .center, spacing: 8){
                            TextView(text: "Owner", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                            TextView(text: "537K", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        }
                        Spacer()
                        Spacer()
                        VStack(alignment: .center, spacing: 8){
                            TextView(text: "Floor Price", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                            HStack(spacing: 4){
                                Image(colorScheme == .dark ? "ic_eth_light" : "ic_eth")
                                TextView(text: "971 ETH", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            }
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
                    .padding(.top, 16)
                    
                    SlidingTabView(selection: self.$selectedTabIndex,
                                   tabs: ["Item", "Activity", "About"],
                                   animation: .easeInOut,
                                   activeAccentColor: colorScheme == .dark ? Color(hex: ColorHelper.white.description) : Color(hex: ColorHelper.primary500.description),
                                   inactiveAccentColor: colorScheme == .dark ? Color(hex: ColorHelper.neutral400.description) : Color(hex: ColorHelper.neutral200.description),
                                   selectionBarColor: colorScheme == .dark ? Color(hex: ColorHelper.white.description) : Color(hex: ColorHelper.primary500.description))
                    
                    if selectedTabIndex == 0 {
                        VStack {
                            
                            
                            
                            ForEach(store.items) { item in
                                // article view
                                NavigationLink(destination: DetailCollectionView()) {
                                    TrendingRow(auction: Auction(id: item.id, title: item.title, currentBid: item.currentBid, endIn: item.endIn))
                                }
                            }.frame(maxWidth: .infinity)
                                .padding(.top, 20)
                        }.padding(.bottom, 16)
                    } else if selectedTabIndex == 1 {
                        ForEach(activity) { activity in
                            ActivityRow(activity: activity)
                        }
                    }
                    
                    Spacer()
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
        .navigationBarBackButtonHidden(false)
        .toolbar {
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
    }
}

struct DetailCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCreatorView()
    }
}
