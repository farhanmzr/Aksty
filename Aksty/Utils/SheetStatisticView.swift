//
//  SheetStatisticView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 03/02/23.
//

import SwiftUI

struct SheetStatisticView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading){
            
            Group {
                HStack{
                    TextView(text: "Filter", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    Spacer()
                    TextView(text: "Reset", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.neutral300.description)
                }.padding(.bottom, 24)
                    .padding(.top, 24)
                
                TextView(text: "Category", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 16)
                
                HStack{
                    TextView(text: "All Category", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    Spacer()
                    Image(colorScheme == .dark ? "ic_arrow_down_light": "ic_arrow_down")
                }
                .padding([.horizontal, .vertical], 20)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                )
                .padding(.bottom, 20)
            }
            
            Group {
                TextView(text: "Category", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 12)
                //
                
                HStack(alignment: .center){
                    TextView(text: "Daily", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 28)
                        .overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .stroke(Color(hex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.primary500.description), lineWidth: 1.5)
                        )
                        .padding(.bottom, 20)
                    Spacer()
                    TextView(text: "Weekly", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 28)
                        .overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .stroke(Color(hex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.primary500.description), lineWidth: 1.5)
                        )
                        .padding(.bottom, 20)
                    Spacer()
                    TextView(text: "Monthly", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        .padding(.vertical, 14)
                        .padding(.horizontal, 28)
                        .overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .stroke(Color(hex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.primary500.description), lineWidth: 1.5)
                        )
                        .padding(.bottom, 20)
                }
                
                
            }
            
            Group {
                
                TextView(text: "Chains", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 16)
                
                HStack{
                    TextView(text: "All Chains)", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
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

struct SheetStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        SheetStatisticView()
    }
}
