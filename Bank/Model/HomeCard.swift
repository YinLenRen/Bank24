//
//  HomeCard.swift
//  test
//
//  Created by 许丰炼 on 2022/3/28.
//

import SwiftUI

//MARK: - Sample Card Model and Data

struct HomeCard: Identifiable{
    var id = UUID().uuidString
    var name: String
    var cardNumber: String
    var cardImage: String
}

var homeCards: [HomeCard] = [
    HomeCard(name: "蔚宝", cardNumber: "4761 1200 1000 0492", cardImage: "HomeCard1"),
    HomeCard(name: "蔚宝", cardNumber: "5204 2477 5000 1471", cardImage: "HomeCard2"),
    HomeCard(name: "蔚宝", cardNumber: "6799 9989 1234 1060", cardImage: "HomeCard3")
]
