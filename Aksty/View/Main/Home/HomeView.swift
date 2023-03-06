//
//  HomeView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 03/11/22.
//

import SwiftUI

class Store: ObservableObject {
    @Published var items: [Auction]
    
    let titles: [String] = ["The Cube 01", "The Cube 02", "The Cube 03", "The Cube 4"]
    let currentBids: [String] = ["15.2", "20.5", "35", "42.7"]
    let endIns: [String] = ["03h : 23m : 15s", "05h : 19m : 05s", "11h : 53m : 20s", "14h : 38m : 07s"]

    // dummy data
    init() {
        items = []
        for i in 0...3 {
            let new = Auction(id: i, title: titles[i], currentBid: currentBids[i], endIn: endIns[i])
            items.append(new)
        }
    }
}

struct HomeView: View {
    
    var collectionList = [
        Collection(name: "Sarafuru", number: "1", floorPrice: "3.5", price: "15,341.53", percent: "+ 71,9%", isPercentMinus: false),
        Collection(name: "AnakPunk", number: "2", floorPrice: "2.6", price: "8,341.53", percent: "- 64,1%", isPercentMinus: true),
        Collection(name: "CoolDog NFT", number: "3", floorPrice: "3.9", price: "9,131.53", percent: "+ 81,2%", isPercentMinus: false),
        Collection(name: "Wesiyowesi NFT", number: "4", floorPrice: "3.2", price: "8,128.76", percent: "+ 45,6%", isPercentMinus: false),
        Collection(name: "HooTenan NFT", number: "5", floorPrice: "3.1", price: "10,137.41", percent: "+ 54.1%", isPercentMinus: false)
      ]
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var store = Store()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        
                        Group {
                            
                            HStack{
                                TextView(text: "Marketplace", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                                Spacer()
                                Image("img_profile")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            }.padding(.bottom, 24)
                            
                            HStack {
                                Image("ic_search")
                                    .padding(.leading, 24)
                                    .padding(.trailing, 12)
                                NavigationLink(destination: ResultSearchView(selectedTabIndex: 1)) {
                                    TextView(text: "Search product ...", font: FontHelper.medium.description, size: 14, colorHex: ColorHelper.neutral200.description)
                                }
                            }
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .overlay(
                                RoundedRectangle(cornerRadius: 28)
                                    .stroke(Color(hex: ColorHelper.neutral100.description), lineWidth: 1.5)
                            ).padding(.bottom, 24)
                        }
                        
                        Group {
                            
                            HStack{
                                TextView(text: "Trending Auction 🔥", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                                Spacer()
                                NavigationLink(destination: TrendingActionView()){
                                    TextView(text: "See All", font: FontHelper.semibold.description, size: 14, colorHex: ColorHelper.neutral300.description)
                                }
                            }.padding(.bottom, 16)
                            
                            ZStack {
                                ForEach(store.items) { item in
                                            
                                    NavigationLink(destination: DetailCollectionView()) {
                                        
                                        AuctionRow(auction: Auction(id: item.id, title: item.title, currentBid: item.currentBid, endIn: item.endIn))
                                    }
                                        .scaleEffect(1.0 - abs(distance(item.id)) * 0.1 )
                                        .opacity(1.0 - abs(distance(item.id)) * 0.3 )
                                        .offset(x: myXOffset(item.id), y: 0)
                                        .zIndex(1.0 - abs(distance(item.id)) * 0.1)
                                }
                            }
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        draggingItem = snappedItem + value.translation.width / 100
                                    }
                                    .onEnded { value in
                                        withAnimation {
                                            draggingItem = snappedItem + value.translation.width / 100
                                            draggingItem = round(draggingItem).remainder(dividingBy: Double(store.items.count))
                                            snappedItem = draggingItem
                                        }
                                    }
                            ).padding(.bottom, 16)
                            
                            
                        }
                        
                        Spacer()
                        
                        Group {
                            
                            HStack{
                                TextView(text: "Top Collections", font: FontHelper.bold.description, size: 16, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                                Spacer()
                                NavigationLink(destination: TopCollectionCreatorView()){
                                    TextView(text: "See All", font: FontHelper.semibold.description, size: 14, colorHex: ColorHelper.neutral300.description)
                                }
                            }.padding(.bottom, 24)
                            
                            ForEach(collectionList) { list in
                                CollectionRow(collection: list)
                            }
                            
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
        }.navigationViewStyle(StackNavigationViewStyle())
        
        
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(store.items.count))
    }
        
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(store.items.count) * distance(item)
        return sin(angle) * 285
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


