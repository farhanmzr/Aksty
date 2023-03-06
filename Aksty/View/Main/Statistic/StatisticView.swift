//
//  StatisticView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 03/11/22.
//

import SwiftUI
import SlidingTabView

struct StatisticView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var selectedTabIndex = 0
    @State private var showSheet = false
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    
                    HStack{
                        TextView(text: "Ranking", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        Image(colorScheme == .dark ? "ic_arrow_down_light" : "ic_arrow_down")
                        Spacer()
                        Image(colorScheme == .dark ? "ic_search_light" : "ic_search_normal")
                            .padding(.trailing, 12)
                        Button(action: {
                            showSheet.toggle()
                        }, label: {
                            Image(colorScheme == .dark ? "ic_filter_light" : "ic_filter")
                        })
                        .accessibilityAddTraits(.isHeader)
                        .sheet(isPresented: $showSheet) {
                            if #available(iOS 16.0, *) {
                                SheetStatisticView()
                                    .presentationDetents([.height(680)])
                                    .presentationDragIndicator(.hidden)
                            } else {
                                // Fallback on earlier versions
                            }
                        }
                    }.padding(.bottom, 12)
                    
                    SlidingTabView(selection: self.$selectedTabIndex,
                                   tabs: ["Top", "Trending", "Watchlist"],
                                   animation: .easeInOut,
                                   activeAccentColor: colorScheme == .dark ? Color(hex: ColorHelper.white.description) : Color(hex: ColorHelper.primary500.description),
                                   inactiveAccentColor: colorScheme == .dark ? Color(hex: ColorHelper.neutral400.description) : Color(hex: ColorHelper.neutral200.description),
                                   selectionBarColor: colorScheme == .dark ? Color(hex: ColorHelper.white.description) : Color(hex: ColorHelper.primary500.description))
                    if selectedTabIndex == 0 {
                        
                        TopStatisticView()
                            .padding(.top, 16)
                        
                    } else if selectedTabIndex == 1 {
                        
                    } else if selectedTabIndex == 2 {
                        
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

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
    }
}

struct TopStatisticView: View {
    
    var collectionList = [
        Collection(name: "Sarafuru", number: "1", floorPrice: "3.5", price: "15,341.53", percent: "+ 71,9%", isPercentMinus: false),
        Collection(name: "AnakPunk", number: "2", floorPrice: "2.6", price: "8,341.53", percent: "- 64,1%", isPercentMinus: true),
        Collection(name: "CoolDog NFT", number: "3", floorPrice: "3.9", price: "9,131.53", percent: "+ 81,2%", isPercentMinus: false),
        Collection(name: "Wesiyowesi", number: "4", floorPrice: "3.2", price: "8,128.76", percent: "+ 45,6%", isPercentMinus: false),
        Collection(name: "My NFT", number: "5", floorPrice: "3.1", price: "10,137.41", percent: "- 24.1%", isPercentMinus: true),
        Collection(name: "Pablo NFT", number: "6", floorPrice: "3.1", price: "6,144.41", percent: "+ 83.6%", isPercentMinus: false),
        Collection(name: "Monseratez", number: "7", floorPrice: "3.1", price: "15,923.41", percent: "+ 37.5%", isPercentMinus: false)
    ]
    
    var body: some View {
        
        VStack{
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    RecentFilterView(text: "All Category")
                    
                    RecentFilterView(text: "Daily")
                    
                    RecentFilterView(text: "All Chains")
                }
            }
            
            ForEach(collectionList) { offer in
                CollectionRow(collection: offer)
            }
            
        }
        
    }
}

struct RecentFilterView: View {
    
    var text: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack{
            TextView(text: text, font: FontHelper.bold.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
            Image(colorScheme == .dark ? "ic_close_search_light":"ic_close_search")
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 24)
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
        ).padding(.bottom, 24)
    }
}
