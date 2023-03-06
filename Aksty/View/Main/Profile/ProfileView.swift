//
//  ProfileView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 03/11/22.
//

import SwiftUI
import SlidingTabView

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var selectedTabIndex = 0
    @StateObject var store = Store()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    
                    HStack{
                        TextView(text: "Profile", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        Spacer()
                        NavigationLink(destination: SettingView()) {
                            Image(colorScheme == .dark ? "ic_setting_light" : "ic_setting")
                                .padding(.trailing, 12)
                        }
                    }.padding(.bottom, 32)
                    
                    HStack {
                        Image("img_profile")
                            .resizable()
                            .frame(width: 88, height: 88)
                            .clipShape(Circle())
                            .padding(.trailing, 12)
                        
                        VStack(alignment: .leading){
                            TextView(text: "Dewa Siwa", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            HStack{
                                TextView(text: "0casdaWDdsasaras...a1b2", font: FontHelper.bold.description, size: 12, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                                Image("ic_copy")
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral400.description : ColorHelper.neutral100.description), in:RoundedRectangle(cornerRadius: 32))
                        }
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: colorScheme == .dark ? ColorHelper.bgProfile.description : ColorHelper.white.description), in:RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .gray.opacity(0.6), radius: 0.5)
                    .padding(.bottom, 32)
                    
                    
                    HStack(alignment: .center){
                        
                        VStack(alignment: .center){
                            TextView(text: "8", font: FontHelper.bold.description, size: 18, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description).padding(.bottom, 4)
                            TextView(text: "Created", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                        }
                        Spacer()
                        Image("ic_divider")
                        Spacer()
                        VStack(alignment: .center){
                            TextView(text: "512", font: FontHelper.bold.description, size: 18, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description).padding(.bottom, 4)
                            TextView(text: "Followers", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                        }
                        Spacer()
                        Image("ic_divider")
                        Spacer()
                        VStack(alignment: .center){
                            TextView(text: "12", font: FontHelper.bold.description, size: 18, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description).padding(.bottom, 4)
                            TextView(text: "Following", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral300.description : ColorHelper.neutral300.description)
                        }
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 32)
                    
                    
                    SlidingTabView(selection: self.$selectedTabIndex,
                                   tabs: ["My NFT", "Collection"],
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
                    }
                    
                    Spacer()
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
