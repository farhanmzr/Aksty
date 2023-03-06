//
//  CreateItemView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 06/02/23.
//

import SwiftUI

struct CreateItemView: View {
    

    @Environment(\.colorScheme) var colorScheme
    
    @State private var itemName: String = ""
    @State private var desc: String = ""
    @State private var royalty: String = ""
    @State private var date: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    
                    Group {
                        TextView(text: "Item Name", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral200.description : ColorHelper.neutral500.description)
                            .padding(.top, 40)
                            .padding(.bottom, 4)
                        
                        TextField("Circle Puzzle", text: $itemName)
                            .font(.custom(FontHelper.medium.description, size: 14))
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
                            .overlay(
                                    RoundedRectangle(cornerRadius: 26)
                                        .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                            )
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .accentColor(Color(.gray))
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.bottom, 12)
                        
                        TextView(text: "Description", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral200.description : ColorHelper.neutral500.description)
                            .padding(.bottom, 4)
                        
                        if #available(iOS 16.0, *) {
                            TextField("Circle Puzzle is a collection of 123 where each NFT gives you access to the most exclusive club on earth. Devoted Entrepreneurs ", text: $desc, axis: .vertical)
                                .font(.custom(FontHelper.medium.description, size: 14))
                                .lineLimit(4, reservesSpace: true)
                                .frame(maxWidth: .infinity)
                                .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 26)
                                        .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                                )
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .accentColor(Color(.gray))
                                .padding(.bottom, 12)
                        } else {
                            // Fallback on earlier versions
                        }
                        
                        TextView(text: "Royalty", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral200.description : ColorHelper.neutral500.description)
                            .padding(.bottom, 4)
                        
                        HStack {
                            TextField("Set Royalty", text: $royalty)
                                .font(.custom(FontHelper.medium.description, size: 14))
                            Image(colorScheme == .dark ? "ic_royalty_light" : "ic_royalty")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .trailing)
                            
                            }
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
                            .overlay(
                                    RoundedRectangle(cornerRadius: 26)
                                        .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                            )
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .accentColor(Color(.gray))
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.bottom, 12)
                        
                        TextView(text: "Sales End", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.neutral200.description : ColorHelper.neutral500.description)
                            .padding(.bottom, 4)
                        
                        HStack {
                            TextField("Choose Date", text: $date)
                                .font(.custom(FontHelper.medium.description, size: 14))
                            Image(colorScheme == .dark ? "ic_calendar_light" : "ic_calendar")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .trailing)
                            
                            }
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24))
                            .overlay(
                                    RoundedRectangle(cornerRadius: 26)
                                        .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                            )
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .accentColor(Color(.gray))
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.bottom, 12)
                    }
                    
                    
                    Spacer()
                    
                    Button(action: {
                            
                    }, label: {
                        NavigationLink(destination: PreviewCreateItemView()){
                            TextView(text: "Preview", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.primary500.description)
                                .padding(.vertical, 20)
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color(hex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.primary500.description), lineWidth: 1.5)
                    )
                    .padding(.bottom, 12)
                    
                    Button(action: {
                            
                    }, label: {
                        NavigationLink(destination: SuccessUploadItemView()){
                            TextView(text: "Create Item", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity)
                                .background(Color(hex: ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
                        }
                    })
                    .padding(.bottom, 24)
                    
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
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

struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreateItemView()
    }
}
