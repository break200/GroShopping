//
//  SingInView.swift
//  GroShopping
//
//  Created by break200 on 4/23/24.
//

import SwiftUI

struct SingInView: View {
    var body: some View {
        ZStack{
            Image(DefineImage.SIGN_BOTTOMBG)
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Image(DefineImage.SIGN_SIGMTOP)
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height: .screenHeight * 0.45)
                Spacer()
            }
            ScrollView(.vertical,showsIndicators: false) {
                VStack(alignment: .leading){
                    Text(Define.SIG_TITLE)
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundStyle(Color.primaryText)
                        .multilineTextAlignment(.leading)
                        .paddingBottom(pi: 20)
                    NavigationLink{
                        LoginView()
                    }label: {
                        RoundButton(title: Define.SIG_EMAILIN,backcolor: Color(hex: "5383EC"), corner: 20)
                            .paddingBottom(pi: 8)
                    }
                    
                    NavigationLink{
                        LoginView()
                    }label: {
                        RoundButton(title: Define.SIG_EMAILUP,backcolor: .primaryApp, corner: 20)
                            .paddingBottom(pi: 8)
                    }
                    
                    Divider()
                    
                    Text(Define.SIG_CONNECT)
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundStyle(Color.textTitle)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity , alignment: .center)
                        .paddingVertical(pi: 25)
                    
                    NavigationLink{
                        LoginView()
                    }label: {
                        
                        RoundButtonImg(title: Define.SIG_GOOGLE,img: DefineImage.SIGN_GOOGLE , backcolor: Color(hex: "5383EC") ,corner: 20 )
                            .paddingBottom(pi: 8)
                    }
                    
                    NavigationLink{
                        LoginView()
                    }label: {
                        RoundButtonImg(title: Define.SIG_FACEBOOK,img: DefineImage.SIGN_FACEBOOK , backcolor: Color(hex: "4A66AC") ,corner: 20 )
                    }
                }
                .padding(.top , .topInsets + .screenWidth * 0.45)
                .paddingHorizontal(pi: 20)
            }
            
        }.naviOption(title: "", backBtnHidden: true, naviBarHidden: true)
         .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        SingInView()
    }
}
