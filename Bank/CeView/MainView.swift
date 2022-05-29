//
//  MainVIew.swift
//  MIneview
//
//  Created by xfl on 2022/3/27.
//

import SwiftUI

struct MainView: View {
    
    @State var currentTab: String = "个人中心"
    
    @State var showMenu: Bool = false
    
//    @Binding var selection: Int
    
    
//    init(){
//        UITabBar.appearance().isHidden = false
//        _selection = .init(projectedValue: .constant(0))
//    }
    
    var body: some View {
            
            ZStack{
                SideMenu(currentTab: $currentTab)
                
                
                
                CustomTabView(currentTab: $currentTab, showMenu: $showMenu)
                    .cornerRadius(showMenu ? 25 : 0)
                    .rotation3DEffect(.init(degrees: showMenu ? -15 : 0), axis: (x: 0, y: 1, z: 0), anchor: .trailing)
                    .offset(x: showMenu ? getRect().width / 2 : 0)
                    .ignoresSafeArea()
                   
                //                .onAppear{
                //                                    if showMenu == true{
                //                                        UITabBar.appearance().isHidden = true
                //                                    }else{
                //                                        UITabBar.appearance().isHidden = false
                //                                    }
                //                                }
                //                .onChange(of: showMenu) { newValue in
                ////                    if newValue == true{
                ////                        UITabBar.appearance().isHidden = true
                ////                    }else{
                ////                        UITabBar.appearance().isHidden = false
                ////                    }
                //                    UITabBar.appearance().isHidden = true
                //                }
                
            }
            
            .preferredColorScheme(.light)
    }
}
//
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View{
    func getSafeArea() -> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
}
