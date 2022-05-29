//
//  TestView1.swift
//  Bank
//
//  Created by 许丰炼 on 2022/3/25.
//

import SwiftUI

struct TestView1: View {

    @Binding var isActive : Bool
    @State private var showButtonView = false
    
    @State private var wallet = Wallet(cards: cards)
    
    @State private var action: Int? = 0

    var body: some View {
//        NavigationLink("111", isActive: $aaa, destination: EmptyView())
        VStack{
            VStack{
                
//                NavigationLink(destination: WalletView(action:$action).environmentObject(wallet), tag : 1, selection: $action) {
//                    EmptyView()
//                }
                NavigationLink(destination: AnalyticsView(), tag : 1, selection: $action) {
                    EmptyView()
                }
                Button(action:{
                    self.action=1
                }){
                    HStack{
                        Spacer()
                        Text("存入")
                        Spacer()
                    } .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(50)
                }
            }.padding()
            
            VStack{
                
//                NavigationLink(destination: WalletView().environmentObject(wallet), isActive: $showButtonView) {
//                    EmptyView()
//
//                }
                Button(action:{
                    self.showButtonView = true
                }){
                    Text("点击按钮跳转页面")
                }
            }
        }
    }
}
//struct TestView1_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView1(isActive: .constant(true))
//    }
//}
