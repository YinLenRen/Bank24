//
//  MyBankcard.swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/19.
//

import SwiftUI

struct MyBankcardView: View {
    @Binding var isActive:Bool
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MyBankcardView_Previews: PreviewProvider {
    static var previews: some View {
        MyBankcardView(isActive: .constant(true))
    }
}
