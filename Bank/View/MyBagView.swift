//
//  MyBagView.swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/19.
//

import SwiftUI

struct MyBagView: View {
    @Binding var isActive:Bool
    var body: some View {
        ScrollView{
            VStack{
                Text("111")
                Text("111")
                Text("111")
            }
        }
    }
}

struct MyBagView_Previews: PreviewProvider {
    static var previews: some View {
        MyBagView(isActive: .constant(true))
    }
}
