//
//  ResultSearchView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 03/02/23.
//

import SwiftUI
import SlidingTabView

struct ResultSearchView: View {
    
    var creatorList = [
        Creator(number: "1", username: "@AksaNFT", totalFollowers: "1.241 followers", isVerify: true, isFollow: true),
        Creator(number: "2", username: "@HelloNFT", totalFollowers: "821 followers", isVerify: false, isFollow: false),
        Creator(number: "3", username: "@MyNFT", totalFollowers: "622 followers", isVerify: true, isFollow: true),
        Creator(number: "4", username: "@BigNFT", totalFollowers: "225 followers", isVerify: true, isFollow: false),
        Creator(number: "5", username: "@CircleNFT", totalFollowers: "451 followers", isVerify: false, isFollow: true),
        Creator(number: "6", username: "@NgeNFT", totalFollowers: "820 followers", isVerify: false, isFollow: false),
        Creator(number: "7", username: "@SemarangNFT", totalFollowers: "194 followers", isVerify: true, isFollow: true)
    ]

    @Environment(\.colorScheme) var colorScheme
    
    @State var selectedTabIndex = 0

        var body: some View {
            VStack(alignment: .leading) {
                
                HStack {
                    TextView(text: "NFT", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        .padding(.leading, 24)
                    Spacer()
                    Image(colorScheme == .dark ? "ic_close_search_light" : "ic_close_search")
                        .padding(.trailing, 24)
                }
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(Color(hex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.primary500.description), lineWidth: 1.5)
                ).padding(.bottom, 16)
                
                TextView(text: "Search Result", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 8)
                
                SlidingTabView(selection: self.$selectedTabIndex,
                               tabs: ["Items", "Creator", "Collection"],
                               animation: .easeInOut,
                               activeAccentColor: colorScheme == .dark ? Color(hex: ColorHelper.white.description) : Color(hex: ColorHelper.primary500.description),
                               inactiveAccentColor: colorScheme == .dark ? Color(hex: ColorHelper.neutral400.description) : Color(hex: ColorHelper.neutral200.description),
                               selectionBarColor: colorScheme == .dark ? Color(hex: ColorHelper.white.description) : Color(hex: ColorHelper.primary500.description))
                if selectedTabIndex == 0 {
                    
                } else if selectedTabIndex == 1 {
                    ForEach(creatorList) { list in
                        CreatorWithoutNumberRow(creator: list)
                    }
                } else if selectedTabIndex == 2 {
                    
                }
                Spacer()
            }
            .padding(.horizontal, 20)
                .padding(.top, 24)
            .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
        }
}

struct ResultSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ResultSearchView(selectedTabIndex: 0)
    }
}
