//
//  MyAccountView.swift
//  Bank
//
//  Created by FFF on 2022/1/19.
//

import SwiftUI

struct MyAccountView: View {
    @Binding var isActive:Bool
    var body: some View {
        VStack{
//            NavigationLink(destination: BuyView(item:  ,isActive: $isActive)){
//                Text("111")
//            }
        }
    }
}

struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountView(isActive: .constant(true))
    }
}
