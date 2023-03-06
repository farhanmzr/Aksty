//
//  SearchView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 03/11/22.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundColor(.blue)
            .background(Color(.blue))
            .clipShape(Capsule())
    }
}


struct SearchView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject var store = Store()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .leading){
                
                HStack{
                    TextView(text: "Collection", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    Image(colorScheme == .dark ? "ic_arrow_down_light": "ic_arrow_down")
                        .padding(.trailing, 12)
                    Spacer()
                    Image(colorScheme == .dark ? "ic_search_light" : "ic_search_normal")
                        .padding(.trailing, 16)
                    
                    Menu {
                        Button(action: {
                            
                        }, label: {
                            Text("All")
                        }).buttonStyle(MyButtonStyle())
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Hot Bid")
                        }).buttonStyle(MyButtonStyle())
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Featured")
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Text("New Release").tint(.blue)
                        }).tint(.blue)
                        
                    } label: {
                        Image(colorScheme == .dark ? "ic_sort_light" : "ic_sort_black")
                    }
                    
                }.padding(.bottom, 24)
                
                HStack{
                    TextView(text: "All Categories", font: FontHelper.medium.description, size: 14, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    Spacer()
                    Image(colorScheme == .dark ? "ic_arrow_down_light": "ic_arrow_down")
                }
                .padding([.horizontal, .vertical], 20)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                ).padding(.bottom, 24)
                
                VStack {
                    ForEach(store.items) { item in
                        // article view
                        NavigationLink(destination: DetailCollectionView()) {
                            TrendingRow(auction: Auction(id: item.id, title: item.title, currentBid: item.currentBid, endIn: item.endIn))
                        }
                    }.frame(maxWidth: .infinity)
                        .padding(.bottom, 32)
                }.padding(.bottom, 16)
                
                Spacer()
                
            }.padding([.leading, .trailing], 20)
                .padding(.top, 24)
            
        }
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
