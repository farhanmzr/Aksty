//
//  OTPView.swift
//  Test-iOS16
//
//  Created by Farhan Mazario on 27/10/22.
//

import SwiftUI

struct OTPView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var OTPData: OTPDataModel
    
    var isSelected: Bool
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                TextView(text: "Create Your Pin Code", font: FontHelper.bold.description, size: 24, colorHex: colorScheme == .dark ? ColorHelper.white.description : ColorHelper.neutral500.description)
                    .padding(.top, 48)
                    .padding(.leading, 16)
                TextView(text: "Create a 6-digit PIN Code that will be used every time your login", font: FontHelper.medium.description, size: 16, colorHex: ColorHelper.neutral300.description)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 4)
                    .padding(.leading, 16)
                    .padding(.bottom, 32)
                HStack(spacing: 12){
                    ForEach(0..<6, id: \.self){index in
                        CustomTF(code: getCodeAtIndex(index: index), isSelected: ((OTPData.code.count == index) && (isSelected)) ? true : false)
                    }
                    NavigationLink(destination: PreferredWalletView(), isActive: $OTPData.navigationViewIsActive) {
                        EmptyView()
                    }
                }.frame(maxWidth: .infinity)
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            CustomNumericalKeyboardView(data: OTPData)
        }
        .background(Color(hex: colorScheme == .dark ? ColorHelper.neutral500.description : ColorHelper.white.description))
    }
    
    func getCodeAtIndex(index:Int)->String{
        
        if OTPData.code.count > index {
            let start = OTPData.code.startIndex
            let current = OTPData.code.index(start, offsetBy: index)
            return String(OTPData.code[current])
        }
        
        return ""
    }
    
}

struct CustomTF: View{
    
    @Environment(\.colorScheme) var colorScheme
    var textboxColor = Color(hex: ColorHelper.neutral100.description)
    var selectedColor = Color(hex: ColorHelper.primary400.description)
    var darkSelectedColor = Color(hex: ColorHelper.white.description)
    var bgWhite = Color(hex: ColorHelper.white.description)
    var code: String
    var isSelected: Bool = false
    
    var body: some View {
        Text(code)
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .frame(width: 52, height: 52)
            .cornerRadius(26)
            .overlay(
                RoundedRectangle(cornerRadius: 26)
                    .stroke(isSelected ? colorScheme == .dark ? darkSelectedColor : selectedColor : textboxColor, lineWidth: 2)
            )
    }
}

class OTPDataModel: ObservableObject {
    @Published var code = ""
    @Published var navigationViewIsActive: Bool = false
}

struct CustomNumericalKeyboardView: View {
    
    @Environment(\.colorScheme) var colorScheme
    // variable data is the data model
    @ObservedObject var data : OTPDataModel
    // rows are the array of values that can be used in numerical kayboard
    var rows = ["1","2","3","4","5","6","7","8","9","","0","delete.left",]
    var keyboardColor = Color(red: 235/255, green: 235/255, blue: 235/255)
    var darkKeyboardColor = Color(hex: ColorHelper.neutral500.description)

    var body: some View {
        // MARK: - MainVStack
        VStack{
            VStack{
                Spacer().frame( height: UIScreen.main.bounds.size.height/1.8)
            }
            // GeometryReader for allining width and height of the keyboardview
            GeometryReader{reader in
                VStack{
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: UIScreen.main.bounds.size.width/18.75), count: 3),spacing:UIScreen.main.bounds.size.width/25){
                        ForEach(rows,id:\.self){value in
                            // Below Button is for keyboard Button and functionality
                            Button(action: {
                                //keyboard Button Action
                                buttonAction(value:value)})
                            {
                                ZStack{
                                    //"delete.left" is the default available image for back button in iOS
                                    
                                    if value == "delete.left"{
                                        Image(systemName:value)
                                            .font(.title2)
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                    }
                                    else{
                                        //keyboard Button Text
                                        Text(value)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                    }
                                }
                                //CustomNumericalKeyboard Frame
                                .frame(width: getWidth(frame: reader.frame(in: .global)), height: getHeight(frame: reader.frame(in: .global)))
                                .background(colorScheme == .dark ? Color(hex: ColorHelper.neutral500.description) : Color.white)
                                .cornerRadius(10)

                            }
                        }
                    }
                }
            }
            .padding()
            //CustomNumericalKeyboard background Color
            .background( colorScheme == .dark ? darkKeyboardColor : keyboardColor)
        }
        //MainVstack
    }
    //To get the width of CustomNumericalKeyboard
    func getWidth(frame:CGRect)->CGFloat{

        let width = frame.width
        let actualWidth = width - (UIScreen.main.bounds.size.width/9.375)
        return actualWidth / 3
    }
    //To get the Height of CustomNumericalKeyboard
    func getHeight(frame:CGRect)->CGFloat{
        let height = frame.height
        let actualHeight = height - ((UIScreen.main.bounds.size.height < 800) ? (UIScreen.main.bounds.size.height/14.72):(UIScreen.main.bounds.size.height/27.0666667))
        return actualHeight / 4
    }

    //CustomNumericalKeyboard Button Action
    func buttonAction(value:String){
        //CustomNumericalKeyboard Button Action when delete is pressed
        if value == "delete.left" && data.code != ""{
            data.code.removeLast()
        }
        //CustomNumericalKeyboard Button Action when pressing numerical
        if value != "delete.left"{
            if data.code.count < 6{
                data.code.append(contentsOf: value)
            }
            if data.code.count == 6 {
                data.navigationViewIsActive = true
                print(data.code)
            }
        }
    }

}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView(OTPData: OTPDataModel.init(), isSelected: true)
    }
}
