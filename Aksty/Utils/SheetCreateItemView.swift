//
//  SheetCreateItemView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 07/02/23.
//

import SwiftUI

struct SheetCreateItemView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        NavigationView {
            
        VStack(alignment: .leading){
            
            TextView(text: "Add Item", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                .padding(.bottom, 24)
            
            Button(action: {
                dismiss()
            }, label: {
                NavigationLink(destination: UploadPhotoItemView()) {
                    HStack {
                        
                        Image(colorScheme == .dark ? "ic_singleitem_light" : "ic_singleitem")
                            .padding(.trailing, 8)
                        
                        TextView(text: "Single Item", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        Spacer()
                        
                    }
                }
            }).padding(.bottom, 16)
            
            Button(action: {
                dismiss()
            }, label: {
                NavigationLink(destination: UploadPhotoItemView()) {
                    HStack {
                        
                        Image(colorScheme == .dark ? "ic_multipleitem_light" : "ic_multipleitem")
                            .padding(.trailing, 8)
                        
                        TextView(text: "Multiple Item", font: FontHelper.semibold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                        
                    }
                }
            })
            
            Spacer()
            
        }
        }.padding([.leading, .trailing], 20)
            .padding(.vertical, 24)
            .cornerRadius(32)
    }
}

struct SheetCreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        SheetCreateItemView()
    }
}
