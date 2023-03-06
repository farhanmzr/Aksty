//
//  SheetTrendingAuction.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 27/12/22.
//

import SwiftUI

struct SheetTrendingAuction: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading){
            
            Group {
                HStack{
                    TextView(text: "Filter", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    Spacer()
                    TextView(text: "Reset", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.neutral300.description)
                }.padding(.bottom, 24)
                
                TextView(text: "Status", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 16)
                
                HStack{
                    StatusSelectView(text: "Buy Now", isSelected: true)
                    Spacer()
                    StatusSelectView(text: "On Auction", isSelected: false)
                }.padding(.bottom, 16)
            }
            
            Group {
                HStack{
                    StatusSelectView(text: "New", isSelected: false)
                    Spacer()
                    StatusSelectView(text: "Has Offers", isSelected: false)
                }.padding(.bottom, 24)
                
                TextView(text: "Sort by", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 16)
                
                HStack{
                    TextView(text: "Recently Listed", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    Spacer()
                    Image(colorScheme == .dark ? "ic_arrow_down_light": "ic_arrow_down")
                }
                .padding([.horizontal, .vertical], 20)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                )
                .padding(.bottom, 24)
            }
            
            Group {
                
                TextView(text: "Price", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 16)
                
                HStack{
                    TextView(text: "Dollar (US)", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    Spacer()
                    Image(colorScheme == .dark ? "ic_arrow_down_light": "ic_arrow_down")
                }
                .padding([.horizontal, .vertical], 20)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                ).padding(.bottom, 24)
                
                Button(action: {
                        
                }, label: {
                    TextView(text: "Apply", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
                })
                .padding(.bottom, 24)
                
            }
            Spacer()
            
        }.padding([.leading, .trailing], 20)
            .padding(.top, 24)
            .cornerRadius(32)
    }
}

struct SheetTrendingAuction_Previews: PreviewProvider {
    static var previews: some View {
        SheetTrendingAuction()
    }
}

struct StatusSelectView: View {
    
    @Environment(\.colorScheme) var colorScheme
//    var image: Image
    var text: String
    @State var isSelected: Bool
    
    var body: some View {
        
        Button(action: {
            isSelected.toggle()
        }) {
            HStack{
                VStack(alignment: .leading){
                    Text(text)
                        .font(.custom(FontHelper.semibold.description, size: 16))
                        .foregroundColor(isSelected ? Color(hex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.primary500.description) : Color(hex: colorScheme == .dark ? ColorHelper.neutral200.description : ColorHelper.neutral300.description))
                }.frame(width: 150)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 32)
                    .stroke(isSelected ? Color(hex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.primary500.description) : Color(hex: colorScheme == .dark ? ColorHelper.neutral400.description : ColorHelper.neutral300.description), lineWidth: 1.5)
            )
        }
        
    }
}
