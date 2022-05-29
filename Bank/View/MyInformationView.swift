//
//  MyInformation.swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/17.
//

import SwiftUI

struct MyInformationView: View {
    
    @EnvironmentObject private var information: UserModel
    
    @Binding var isActive:Bool
    var body: some View {
        List {
            HStack{
                Text("头像")
                Spacer()
                Image("touxiang")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)
            }
            HStack{
                Text("姓名")
                Spacer()
                Text(information.realName ?? "许丰炼")
            }
            HStack{
                Text("性别")
                Spacer()
                Text(information.sex == 1 ? "男" : "女")
            }
            HStack{
                Text("手机号")
                Spacer()
                Text(information.phone ?? "19817802090")
            }
            HStack{
                Text("国籍")
                Spacer()
                Text("中国")
            }
            HStack{
                Text("证件类型")
                Spacer()
                Text(information.documentType ?? "身份证")
            }
            HStack{
                Text("证件号码")
                Spacer()
                Text(information.documentCode ?? "330327200009291211")
            }
            HStack{
                Text("邮箱")
                Spacer()
                Text(information.email ?? "546052242@qq.com")
            }
        }
        .navigationTitle("个人信息")
    }
}
struct MyInformationView_Previews: PreviewProvider {
    static var previews: some View {
        MyInformationView(isActive: .constant(true))
    }
}
