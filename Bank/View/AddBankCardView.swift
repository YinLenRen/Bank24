//
//  AddBankCardView.swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/24.
//

import SwiftUI

struct AddBankCardView: View {
    @Binding var isActive:Bool
    var body: some View {
        List {
            HStack{
                Text("姓名")
                    .padding(.trailing,35)
                TextField("请输入姓名",text: .constant(""))
            }
            HStack{
                Text("身份证号")
                TextField("请输入身份证号",text: .constant(""))
                    .keyboardType(.numberPad)
            }
            HStack{
                Text("银行卡号")
                TextField("请输入银行卡号",text: .constant(""))
                    .keyboardType(.numberPad)
            }
        }
        .navigationTitle("绑定银行卡")
        .navigationBarItems(trailing: Button("提交"){
            isActive = false
        })
    }
}

struct AddBankCardView_Previews: PreviewProvider {
    static var previews: some View {
        AddBankCardView(isActive: .constant(true))
    }
}
