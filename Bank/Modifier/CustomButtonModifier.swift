//
//  CustomButtonModifier.swift
//  Bank
//
//  Created by FFF on 2022/3/13.
//

//1
import SwiftUI

/*
 类似css 做全局样式
 */

struct CustomButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        return content
            .foregroundColor(.white)
            .padding(.vertical)
            .padding(.horizontal, 35)
            .background(
                
                LinearGradient(gradient: .init(colors: [Color.yellow, Color.orange]), startPoint: .leading, endPoint: .trailing)
                
            )
            .clipShape(Capsule())
    }
}


