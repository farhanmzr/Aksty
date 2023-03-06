//
//  OnboardingView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 17/10/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var screenSize: CGSize
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 10) {
                
                OffsetPageTabView(offset: $offset) {
                    
                    HStack(spacing: 0){
                        
                        ForEach(onboardings){onboarding in
                            
                            VStack {
                                Image(colorScheme == .dark ? "onboarding_light" : "onboarding")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                                VStack(alignment: .center, spacing: 16) {
                                    
                                    TextView(text: onboarding.title, font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                                        .multilineTextAlignment(.center)
                                    TextView(text: onboarding.description, font: FontHelper.medium.description, size: 16, colorHex: ColorHelper.neutral300.description)
                                        .multilineTextAlignment(.center)
                                        .padding(.leading, 20)
                                        .padding(.trailing, 20)
                                }
                                .foregroundStyle(.white)
                                .padding(.top, 24)
                                
                            }
                            .frame(width: screenSize.width)
                            .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
                        }
                    }
                }
                
                
                .overlay(
                    VStack{
                        
                        //Animated Indicator
                        HStack(alignment: .center, spacing: 10){
                            
                            ForEach(onboardings.indices, id: \.self){index in
                                
                                Capsule()
                                    .fill(Color(hex: colorScheme == .dark ? ColorHelper.neutral400.description : ColorHelper.primary100.description))
                                    .frame(width: getIndex() == index ? 8 : 8, height: 8)
                                    .foregroundColor(.blue)
                            }
                        }
                        .overlay(
                            Capsule()
                                .fill(Color(hex: ColorHelper.primary500.description))
                                .frame(width: 8, height: 8)
                                .offset(x: getIndicatorOffset())
                                
                            ,alignment: .leading
                        )
                        .padding(.bottom, 24)
                        
                        Button(action: {
                                
                        }, label: {
                            NavigationLink(destination: LoginView()){
                                TextView(text: "Get Started", font: FontHelper.bold.description, size: 16, colorHex: ColorHelper.white.description)
                                    .padding(.vertical, 20)
                                    .frame(maxWidth: .infinity)
                                    .background(Color(hex: ColorHelper.primary500.description), in:RoundedRectangle(cornerRadius: 28))
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                            }
                        })
                        .padding(.bottom, 28)
                        
                        TextFooter(text: "Have an account?", text2: "Sign In", colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description, destination: LoginView())
                        
                    }
                    ,alignment: .bottom
                )

            }
            .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // Offset for indicator..
    func getIndicatorOffset()->CGFloat{
        
        let progress = offset / screenSize.width
        
        //10 : spacing
        //8 : Circle size
        let maxWidth: CGFloat = 10 + 8
        
        return progress * maxWidth
        
    }
    
    
    // Expanding index based on offset..
    func getIndex()->Int{
        let progress = round(offset / screenSize.width)
        
        //For saftey..
        let index = min(Int(progress), onboardings.count - 1)
        return index
    }
}





struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextFooter<Destination: View>: View {
    
    var text: String
    var text2: String
    var colorHex: Int
    var destination: Destination
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            TextView(text: text, font: FontHelper.medium.description, size: 14, colorHex: colorHex)
            
            Button(action: {
                
            }, label: {
                NavigationLink(destination: destination){
                    TextView(text: text2, font: FontHelper.bold.description, size: 14, colorHex: ColorHelper.primary500.description)
                }
            })
        }
        .padding(.bottom, 24)
    }
}
