//
//  TrendingActionView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 22/12/22.
//

import SwiftUI


struct TrendingActionView: View {
    
    
    @StateObject var store = Store()
    @Environment(\.colorScheme) var colorScheme
    @State private var showSheet = false
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    
                    Group {
                        
                        HStack{
                            TextView(text: "Trending Auction 🔥", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                            Spacer()
                        }.padding(.bottom, 16)
                        .padding(.top, 24)
                    }
                    
                    Group {
                        
                        VStack {
                            ForEach(store.items) { item in
                            // article view
                            TrendingRow(auction: Auction(id: item.id, title: item.title, currentBid: item.currentBid, endIn: item.endIn))
                            }.frame(maxWidth: .infinity)
                                .padding(.bottom, 32)
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
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    Image(colorScheme == .dark ? "ic_filter_light" : "ic_filter")
                })
                .accessibilityAddTraits(.isHeader)
                .sheet(isPresented: $showSheet) {
                    if #available(iOS 16.0, *) {
                        SheetTrendingAuction()
                            .presentationDetents([.height(680)])
                            .presentationDragIndicator(.hidden)
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
        }
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
    }
}

struct TrendingActionView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingActionView()
    }
}
