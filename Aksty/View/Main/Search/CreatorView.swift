//
//  CreatorView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 09/02/23.
//

import SwiftUI

struct CreatorView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject var store = Store()
    
    var creatorList = [
    ExploreCreator(name: "The Circle of Mind", username: "Sarafuru", totalCollection: "765", totalOwner: "512K", floorPrice: "971 ETH", totalPicture: "+763"),
    ExploreCreator(name: "The Circle of Mind", username: "Sarafuru", totalCollection: "765", totalOwner: "512K", floorPrice: "971 ETH", totalPicture: "+763"),
    ExploreCreator(name: "The Circle of Mind", username: "Sarafuru", totalCollection: "765", totalOwner: "512K", floorPrice: "971 ETH", totalPicture: "+763")
    ]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(alignment: .leading){
                
                HStack{
                    TextView(text: "Creator", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
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
                    
                }.padding(.bottom, 28)
                
                VStack {
                    ForEach(creatorList) { list in
                        NavigationLink(destination: DetailCreatorView()){
                            ExploreCreatorRow(exploreCreator: list)
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

struct CreatorView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorView()
    }
}
