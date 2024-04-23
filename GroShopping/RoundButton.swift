//
//  RoundButton.swift
//  GroShopping
//
//  Created by break200 on 4/23/24.
//

import SwiftUI

struct RoundButton: View {
    
    @State var title:String = "Title"
    @State var forecolor:Color = .white
    @State var backcolor:Color = Color.primaryApp
    @State var alignment:TextAlignment = .center
    @State var size:CGFloat = 18
    @State var font:Gilroy = .semibold
    @State var corner:CGFloat = 20
    
    var body: some View {
        Text(title)
            .font(.customfont(font, fontSize: size))
            .foregroundStyle(forecolor)
            .multilineTextAlignment(alignment)
            .frame(minWidth: 0, maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
            .background(backcolor)
            .cornerRadius(corner)
    }
}

struct RoundButtonImg: View {
    
    @State var title:String = "Title"
    @State var img:String    = DefineImage.SIGN_GOOGLE
    @State var forecolor:Color = .white
    @State var backcolor:Color = Color.primaryApp
    @State var alignment:TextAlignment = .center
    @State var size:CGFloat = 18
    @State var font:Gilroy = .semibold
    @State var corner:CGFloat = 20
    
    var body: some View {
        HStack(alignment: .center){
            Image(img)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            Text(title)
                .foregroundStyle(forecolor)
        }
        //좌우 넓게
        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 60,maxHeight: 60)
        .background(backcolor)
        .cornerRadius(20)
    }
}


struct RoundButtonAction: View {

    @State var title:String = "Title"
    @State var forecolor:Color = .white
    @State var backcolor:Color = Color.primaryApp
    @State var alignment:TextAlignment = .center
    @State var size:CGFloat = 18
    @State var font:Gilroy = .semibold
    @State var corner:CGFloat = 20
    var didTap: (()->())?
    
    var body: some View {
        Text(title)
            .font(.customfont(font, fontSize: size))
            .foregroundStyle(forecolor)
            .multilineTextAlignment(alignment)
            .frame(minWidth: 0, maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
            .background(backcolor)
            .cornerRadius(corner)
            .onTapGesture {
                didTap?()
            }
    }
}

#Preview {
    RoundButton()
}
#Preview {
    RoundButtonImg()
}
#Preview {
    RoundButtonAction()
}
