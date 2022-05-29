//
//  BenHUD.swift
//  Bank
//
//  Created by 许丰炼 on 2022/3/31.
//

import SwiftUI

enum BneHUDType{
    case wait
    case alert
}


struct BenHUD<Content: View>: View {
    
    let type: BneHUDType
    @ViewBuilder let content: Content
    
    var body: some View {
        if type == .wait {
            
            content
                .padding(.horizontal, 10)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.15), radius: 12, x: 0, y: 5)
                    
                )
        }
        
        if type == .alert{
            content
                .padding(.horizontal, 10)
                .padding(16)
                .background(
                        Capsule()
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.15), radius: 12, x: 0, y: 5)
                    
                )
        }
        
    }
}

//struct BenHUD_Previews: PreviewProvider {
//    static var previews: some View {
//        BenHUD()
//    }
//}
