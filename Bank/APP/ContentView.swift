//
//  ContentView.swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/17.
//

import SwiftUI

struct ContentView: View {
    
    
//    @State private var selection = 0

    
    @State var selectedTab: Tab = .home
    
    var body: some View {
      
        
        
//        NavigationView{
        
//            TabView(selection: $selection){
//                HomeView2()
//                    .modifier(BGModifier())
//                    .tabItem({
//                        Image(systemName: "house")
//                        Text("首页")
//                    })
//                    .tag(0)
//                    .navigationBarTitle(selection == 0 ? "首页" : (selection == 1 ? "财富" : "个人中心" ), displayMode: .inline)
//                WalletView2()
//                    .modifier(BGModifier())
//                    .tabItem({
//                        Image(systemName: "creditcard.and.123")
//                        Text("钱包")
//                    })
//                    .tag(1)
//                AnalyticsView()
//                    .modifier(BGModifier())
//                    .tabItem({
//                        Image(systemName: "chart.line.uptrend.xyaxis")
//                        Text("数据")
//                    })
//                    .tag(2)
//                MainView()
//                    .modifier(BGModifier())
//                    .tabItem({
//                        Image(systemName: "person")
//                        Text("我的")
//                    })
//                    .tag(3)
//
//            }
        
//            .animation(.spring(), value: selection)
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)

//        }
        
        ZStack(alignment: .bottom){

//
            Group{
                switch selectedTab {
                case .home:
                    HomeView2()
                        .modifier(BGModifier())
//                        .navigationBarTitle(("首页"), displayMode: .inline)
                       
//                        .navigationBarHidden(true)

                case .wallet:
                    WalletView2()
                        .modifier(BGModifier())
//                        .navigationBarTitle(("钱包"), displayMode: .inline)
                case .chat:
                    AnalyticsView()
                        .modifier(BGModifier())
//                        .navigationBarTitle(("数据"), displayMode: .inline)
                case .person:
                    MineView()
//                        .modifier(BGModifier())
//                        .navigationBarTitle(("个人中心"), displayMode: .inline)
                }
            }
//           .frame(maxWidth: .infinity, maxHeight: .infinity)
//
            HStack{
                ForEach(tabItems){ item in

                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.5)){
                        selectedTab = item.tab
                        }
                    } label: {
                        VStack(spacing: 0){
                            Image(systemName: item.icon)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 22, height: 22)
                                .background(
                                    Color.purple
                                        .opacity(0.1)
                                        .cornerRadius(5)
                                        .blur(radius: 5)
                                        .padding(-7)
                                        .opacity(selectedTab == item.tab ? 1 : 0)

                                )
                                .frame(maxWidth: .infinity)
                                .foregroundColor(
                                    selectedTab == item.tab ? Color.purple : Color.black.opacity(0.3)
                                )

//                                .symbolVariant(.fill)
//                                .font(.body.bold())
//                                .frame(width: 88, height: 29)
                            Text(item.text)
                                .font(.caption)
//                                .lineLimit(1)
                                .foregroundColor(
                                    selectedTab == item.tab ? Color.purple : Color.black.opacity(0.3)
                                )
                        }
                        .frame(maxWidth: .infinity)
                    }
//                    .foregroundStyle(selectedTab != item.tab ? .secondary : .primary)

                }

            }
            .padding(.horizontal, 8)
            .padding(.top, 15)
            .frame(height: 88, alignment: .top)
                .background(Color("Color"), in: RoundedRectangle(cornerRadius: 34, style: .continuous))
//             .overlay(
//                 HStack{
//                    if selectedTab == .person {
//                    Spacer()
//                     }
////
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width:28, height: 5)
////                            .cornerRadius(3)
////                            .frame(width: 120)
////                            .frame(maxHeight: .infinity, alignment: .top)
////
////                        if selectedTab == .home {
////                            Spacer()
////
////                        }
////
////                    }
////
////                        .padding(.horizontal, 8)
////                )
//
////            .strokeStyle(cornerRadius: 34)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .navigationBarTitle("首页", displayMode: .inline)
        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)

    }
//
//    @ViewBuilder
//    func TabButton(image: String, title: String) -> some View{
//        Button{
//            withAnimation {
//                selectedTab = title
//            }
//        }label: {
//            Image(systemName: image)
//                .resizable()
//                .renderingMode(.template)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 25, height: 25)
//                .padding()
//                .foregroundColor(
//                    selectedTab == title ? Color.black : Color.gray.opacity(0.8)
//                )
//        }
//    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BGModifier: ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("Color")
            )
    }
    
}
