//
//  WecomeView.swift
//  GroShopping
//
//  Created by break200 on 4/23/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image(DefineImage.WEL_BGIMAGE)
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            VStack(alignment: .center){
                Spacer()
                Image(DefineImage.WEL_APPLOGO)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60,height: 60)
                Text(Define.WEL_APPLOGO)
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                Text(Define.WEL_APPLOGOCHILD)
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundStyle(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .paddingBottom(pi: 20)
                NavigationLink{
                    SingInView()
                }label: {
                    RoundButton(title: Define.WEL_APPBUTTONTITLE)
                        .padding(20)
                }
                Spacer().frame(height: 80)
            }
        }.naviOption(title: "", backBtnHidden: true, naviBarHidden: true)
        .ignoresSafeArea()
    }
    
}

#Preview {
    NavigationView{
        WelcomeView()
    }
}
