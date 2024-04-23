//
//  RoundButton.swift
//  GroShopping
//
//  Created by break200 on 4/23/24.
//

import SwiftUI

struct RoundButton: View {
    
    @State var title:String = "Title"
    @State var color:Color = Color.primaryApp
    @State var size:CGFloat = 18
    @State var font:Gilroy = .semibold
    @State var corner:CGFloat = 20
    var didTap:(()->())?
    
    var body: some View {
        Button{
            didTap?()
        }label: {
            Text(title)
                .font(.customfont(font, fontSize: size))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }.frame(minWidth: 0, maxWidth: .infinity , minHeight: 60 , maxHeight: 60)
        .background(color)
        .cornerRadius(corner)
        
    }
}
#Preview {
    RoundButton()
        .padding(20)
}
