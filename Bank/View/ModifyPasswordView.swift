//
//  ModifyPassword.swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/17.
//

import SwiftUI

struct ModifyPasswordView: View {
    @Binding var isActive:Bool
    var body: some View {
        List {
            HStack{
                Text("原密码:")
                SecureField("请输入原密码",text:.constant(""))
            }
            HStack{
                Text("新密码:")
                SecureField("请输入新密码",text:.constant(""))
            }
            HStack{
                Text("重复新密码:")
                SecureField("请再次输入新密码",text:.constant(""))
            }
        }
//        .navigationTitle("修改密码")
        .navigationBarTitle(("修改密码"), displayMode: .inline)
        .navigationBarItems(trailing: Button("提交"){
            isActive = false
        })
    }
}
struct ModifyPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyPasswordView(isActive: .constant(true))
    }
}
