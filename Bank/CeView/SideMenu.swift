//
//  SideMenu.swift
//  MIneview
//
//  Created by xfl on 2022/3/27.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var currentTab: String
    
    @Namespace var animation
    
//    @Binding var selection: Int
    
//    @EnvironmentObject var tab: TabBarState
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Image("touxiang")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                
                    .clipShape(Circle())
                
                Text("iJ")
                    .font(.title2.bold())
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                VStack(alignment: .leading, spacing: 25){
                    
//                    CustomTabButton(icon: "creditcard", title: "个人中心")
                    
                    
                    CustomTabButton(icon: "creditcard", title: "我的银行卡")
                    
                    CustomTabButton(icon: "square.and.pencil", title: "修改密码")
                    
                    CustomTabButton(icon: "person.text.rectangle", title: "个人信息")
                    
                    CustomTabButton(icon: "clock", title: "登陆记录")
                    
                    CustomTabButton(icon: "questionmark.circle", title: "帮助")
                    
                    CustomTabButton(icon: "exclamationmark.circle", title: "版本号")
                    
//                    Spacer()
                    
                    CustomTabButton(icon: "rectangle.portrait.and.arrow.right", title: "退出登陆")
                }
                .padding()
                .padding(.top, 20)
                
            })
         
        
            .frame(width: getRect().width / 2, height: getRect().height  - 250, alignment: .leading)
            
            .frame(maxWidth: .infinity, alignment: .leading)
        }
//        .onAppear{
//            print(tab.current ?? "")
//
//        }
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color(red: 245/255, green: 245/255, blue: 245/255)
        )
    }
    
    @ViewBuilder
    func CustomTabButton(icon: String, title: String) ->some View{
        Button{
            if title == "退出登陆"{
                
            }else{
                withAnimation {
////                    if self.tab.current == ""{                        currentTab = title
////                        return
////                    }
//                    if tab.current == "首页" && tab != nil {
//                        currentTab = "首页"
//                    }
//                    print($selection)
//                    if $selection.wrappedValue == 1 {
//                        print(11)
//                        currentTab = "首页"
//                    }
                    
                    currentTab = title
                }
                
            }
        } label: {
            HStack(spacing: 12){
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: currentTab == title ? 48 : nil, height: 48)
                    .foregroundColor(title == "退出登陆" ? .red: .blue)
                
                    .background(
                        ZStack{
                            
                            if currentTab == title{
                                
                                Color.white.clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
                            }
                        }
                    )
                
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(title == "退出登陆" ? .red : .black)
            }
            .padding(.trailing, 18)
            .background(
                ZStack{
                    
                    if currentTab == title{
                        
                        Color(.white)
                            .clipShape(Capsule())
                            .matchedGeometryEffect(id: "TABCAPSULE", in: animation)
                    }
                }
                
            )
        }
        .offset(x: currentTab == title ? 15 : 0)
    }
}

//struct SideMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenu(currentTab: .constant("首页"))
//    }
//}


extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
