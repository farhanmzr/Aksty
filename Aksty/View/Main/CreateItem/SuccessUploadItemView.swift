//
//  SuccessUploadItemView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 06/02/23.
//

import SwiftUI

struct SuccessUploadItemView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .center){
            
            Group {
                
                VStack(alignment: .leading) {
                    Image("img_upload")
                        .resizable()
                        .frame(width: 240,height: 240)
                        .padding(.bottom, 24)
                    
                    TextView(text: "Circle Puzzle", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        .padding(.bottom, 8)
                    
                    TextView(text: "Current Bid", font: FontHelper.medium.description, size: 12, colorHex: ColorHelper.neutral300.description)
                    
                    HStack {
                        Image(colorScheme == .dark ? "ic_eth_light": "ic_eth")
                            .resizable()
                            .frame(width: 24, height: 24)
                        TextView(text: "2.54 ETH", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    }.padding(.bottom, 8)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .background(Color(hex: colorScheme == .dark ? ColorHelper.bgProfile.description : ColorHelper.white.description), in:RoundedRectangle(cornerRadius: 16))
                .shadow(color: .gray.opacity(0.8), radius: 0.8)
                .padding(.bottom, 32)
                
            }
            
            
            Spacer()
            
            VStack(alignment: .center) {
                TextView(text: "Your NFT Has Launch!", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 8)
                TextView(text: "Go-NFT is a platform that make a new experience for NFT Transaction.", font: FontHelper.medium.description, size: 14, colorHex: ColorHelper.neutral300.description)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 32)
                    .padding(.trailing, 32)
            }
            
            Spacer()
            Spacer()

            Button(action: {
                    
            }, label: {
                NavigationLink(destination: MainView(selection: 0)) {
                    TextView(text: "View Item", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
                }
            })
            .padding(.bottom, 24)
            
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

struct SuccessUploadItemView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessUploadItemView()
    }
}
