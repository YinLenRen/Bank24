//
//  SplashScreen.swift
//  Bank
//
//  Created by xfl on 2022/3/15.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack{
            Color("BG")
                .ignoresSafeArea()
            GeometryReader{proxy in
                let size = proxy.size
                
                ZStack{
                    Image("bg1")
//                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
//                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
