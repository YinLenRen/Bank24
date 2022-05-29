//
//  TabItem.swift
//  Bank
//
//  Created by FFF on 2022/3/18.
//

import Foundation

struct TabItem: Identifiable{
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
}

let tabItems = [
    TabItem(text: "首页", icon: "house", tab: .home),
    TabItem(text: "钱包", icon: "creditcard.and.123", tab: .wallet),
    TabItem(text: "数据", icon: "chart.line.uptrend.xyaxis", tab: .chat),
    TabItem(text: "我的", icon: "person", tab: .person)
   
  
]

enum Tab: String{
    case home
    case wallet
    case person
    case chat
}
