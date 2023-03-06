//
//  UploadPhotoItemView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 06/02/23.
//

import SwiftUI

struct UploadPhotoItemView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading){
            
            Group {
                TextView(text: "Upload your best NFT!", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.bottom, 24)
                        .padding(.top, 24)
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Image(colorScheme == .dark ? "ic_info_light": "ic_info")
                            .padding(.trailing, 1)
                        TextView(text: "PNG, GIF, WEBP or MP4, Max 1Gb", font: FontHelper.semibold.description, size: 12, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.information.description)
                        Spacer()
                    }
                    HStack {
                        Image(colorScheme == .dark ? "ic_info_light": "ic_info")
                            .padding(.trailing, 1)
                        TextView(text: "1024 x 1024 px - High Quality", font: FontHelper.semibold.description, size: 12, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.information.description)
                        Spacer()
                    }
                    
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .background(Color(hex: colorScheme == .dark ? ColorHelper.bgProfile.description : ColorHelper.bgBorder.description), in:RoundedRectangle(cornerRadius: 16))
                .shadow(color: .gray.opacity(0.6), radius: 0.5)
                .padding(.bottom, 16)
                
                Image("img_upload")
                    .resizable()
                    .frame(height: 340)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 32)
                
                               
            }
            
            Spacer()
            
            Button(action: {
                    
            }, label: {
                NavigationLink(destination: CreateItemView()) {
                    TextView(text: "Next", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
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
                TextView(text: "Create Item", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .accessibilityAddTraits(.isHeader)
            }
        }
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
    }
}

struct UploadPhotoItemView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPhotoItemView()
    }
}
