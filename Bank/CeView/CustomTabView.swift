//
//  CustomTabView.swift
//  MIneview
//
//  Created by xfl on 2022/3/27.
//

import SwiftUI

struct CustomTabView: View {
    
    @Binding var currentTab: String
    
    @Binding var showMenu: Bool
    
    
//    init(currenTab: Binding<String>){
//        self._currentTab = currenTab
//        UITabBar.appearance().isHidden = true
//    }
   
//
    var body: some View {
        VStack{
            HStack{
                Button{
                    withAnimation(.spring()){
                        
                        showMenu = true
                        print(showMenu)
                    }
                }label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title2)
//                        .foregroundColor(.white)
                }
//                .onChange(of: showMenu, perform: { newValue in
//                    if newValue == false{
//                        UITabBar.appearance().isHidden = true
//                    }
//                })
                .opacity(showMenu ? 0 : 1)
                
                Spacer()
                
                Button{
                    
                }label: {
                    Image("touxiang")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .cornerRadius(5)
                }
            }
//            .overlay(
//                Text(currentTab == "")
//                    .font(.title1.bold())
//                    .foregroundColor(.black)
//                    .opacity(showMenu ? 0 : 1)
//
//            )
            
            .padding([.horizontal, .top])
            .padding(.bottom, 8)
            .padding(.top, getSafeArea().top
            )
            
            TabView(selection: $currentTab) {
                MineView()
                    .tag("个人中心")
                   
                MyBankcardView(isActive: .constant(true))
                    .tag("我的银行卡")
                
                Text("修改密码")
                    .tag("修改密码")
            }
        }
        .disabled(showMenu)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(
//            Color("Color")
//        )
        .overlay(
            
            Button{
                withAnimation(.spring()){
                    showMenu = false
                }
            }label: {
                Image(systemName: "xmark")
                    .font(.title2)
//                        .foregroundColor(.white)
            }
            .opacity(showMenu ? 1 : 0)
            .padding()
            .padding(.top)
            ,alignment: .topLeading
        )
        .background(
            Color(.white)
        )
    }
}

//struct CustomTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
