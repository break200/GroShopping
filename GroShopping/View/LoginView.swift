//
//  LoginView.swift
//  GroShopping
//
//  Created by break200 on 4/24/24.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var log_Email:String = ""
    @State var log_Pass:String = ""
    @State var log_IsShow:Bool = false
    
    
    var body: some View {
        ZStack{
            
            //네비게이션 바
            VStack{
                HStack{
                    Image(DefineImage.LOG_BACK)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            print("뒤로가기 login")
                            mode.wrappedValue.dismiss()
                        }
                    Spacer()
                }
                Spacer()
            }.padding(.top , .topInsets)
                .paddingHorizontal(pi: 20)
                .zIndex(1)
            
            
            Image(DefineImage.SIGN_BOTTOMBG)
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            //화면 구성
            VStack{
                Image(DefineImage.LOG_LOGO)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .paddingBottom(pi: .screenWidth * 0.1)
                
                Text("Loging")
                    .textLeading()
                    .foregroundStyle(Color.primaryText)
                    .font(.customfont(.semibold, fontSize: 26))
                    .paddingBottom(pi:4)
                
                Text("Enter your emails and password")
                    .textLeading()
                    .foregroundStyle(Color.secondaryText)
                    .font(.customfont(.semibold, fontSize: 16))
                    .paddingBottom(pi: .screenWidth * 0.1)
                
                LineTextField(title:"Email" ,placholder: "Please enter" , txt:$log_Email , keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                
                LineSecureField(title:"Password" ,placholder: "Please enter" , txt: $log_Pass, isShow: $log_IsShow)
                    .padding(.bottom, .screenWidth * 0.02)
                
                
                
                NavigationLink {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.customfont(.semibold, fontSize: 14))
                        .textTrailing()
                        .foregroundStyle(Color.primaryText)
                        .paddingBottom(pi: 15)
                }
                
                NavigationLink {
                    
                } label: {
                    RoundButton(title:"Login")
                        .paddingBottom(pi: 15)
                }
                
                
                NavigationLink {
                    
                } label: {
                    HStack(alignment: .center){
                        Text("Don’t have an account?")
                            .foregroundStyle(Color.primaryText)
                            .font(.customfont(.semibold, fontSize: 14))
                        Text("Signup")
                            .foregroundStyle(Color.primaryApp)
                            .font(.customfont(.semibold, fontSize: 14))
                    }
                }
            }.frame(minWidth: 0,maxWidth: .infinity)
                .paddingHorizontal(pi: 20)
        }.naviOption(title: "", backBtnHidden: true, naviBarHidden: true)
            .ignoresSafeArea()
    }
}

#Preview {
    NavigationView{
        LoginView()
    }
}
