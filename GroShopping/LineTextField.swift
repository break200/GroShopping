//
//  LineTextFiled.swift
//  GroShopping
//
//  Created by break200 on 4/24/24.
//

import SwiftUI

struct LineTextField: View {
    
    @State var title:String = "title"
    @State var placholder:String = "placholder"
    @Binding var txt:String
    @State   var keyboardType:UIKeyboardType = .default
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundStyle(Color.textTitle)
                .textLeading()
            
            TextField(placholder, text: $txt)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(height: 40)
            Divider()
        }
    }
}


struct LineSecureField: View {
 
    @State var title:String = "title"
    @State var placholder:String = "placholder"
    @Binding var txt:String
    @Binding var isShow:Bool
    
    var body: some View{
        VStack(alignment: .leading) {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundStyle(Color.textTitle)
                .textLeading()
            
            if(isShow){
                TextField(placholder, text: $txt)
                     //자동 수정
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier(
                        ShowButton(isShow: $isShow)
                    )
                    .frame(height: 40)
            }else{
                SecureField(placholder, text: $txt)
                    //키보드 맨처음 칠 때, 대문자로 시작하는 설정 없애기!
                    .autocapitalization(.none)
                    .modifier(
                        ShowButton(isShow: $isShow)
                    )
                    .frame(height: 40)
            }
            Divider()
        }
    }
}



#Preview {
    LineTextField(txt:.constant("테스트"))
}

#Preview {
    LineSecureField(txt: .constant("여기 등록") ,isShow: .constant(true))
}
