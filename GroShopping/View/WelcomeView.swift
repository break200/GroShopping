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
            Image(DefineImage.BGIMAGE)
                .resizable()
                .scaledToFill()
            
        }.ignoresSafeArea()
    }
    
}

#Preview {
    WelcomeView()
}
