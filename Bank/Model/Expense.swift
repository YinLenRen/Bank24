//
//  Expense.swift
//  test
//
//  Created by 许丰炼 on 2022/3/28.
//

import SwiftUI

//MARK: Expense Model and Sample Data
struct Expense: Identifiable{
    var id = UUID().uuidString
    var amountSpent: String
    var product: String
    var productIcon: String
    var spendType: String
}

var expenses: [Expense] = [
//    Expense ( amountSpent: "$128", product: " Amazon", productIcon: " Amazon" , spendType: "Groceries"),
//    Expense ( amountSpent: "$18", product: "Youtube", productIcon: "Youtube" , spendType: "Streaming"),
//    Expense ( amountSpent: "$10", product: "Dribbble", productIcon: "Dribbble", spendType:"Membership"),
//    Expense ( amountSpent: "$28", product: "Apple", productIcon: "Apple", spendType: "Apple Pay") ,
//    Expense ( amountSpent: "$9", product: "Patreon", productIcon: "Patreon", spendType:"Membership" ),
//    Expense ( amountSpent: "$100", product: "Instagram", productIcon: "Instagram", spendType:"AdPublish"),
//    Expense ( amountSpent: "$99", product: "Figma", productIcon: "Figma", spendType:"Pro Member")
    Expense(amountSpent: "¥12800", product: "6月存款产品", productIcon: "gift.circle" , spendType: "支付宝"),
    Expense(amountSpent: "¥1800", product: "12月存款产品", productIcon: "gift.circle" , spendType: "支付宝"),
    Expense(amountSpent: "¥16650", product: "12月存款产品", productIcon: "gift.circle", spendType: "微信支付"),
    Expense(amountSpent: "¥2800", product: "6月存款产品", productIcon: "gift.circle", spendType: "微信支付"),
    Expense(amountSpent: "¥9000", product: "9月存款产品", productIcon: "gift.circle", spendType: "银行卡支付"),
    Expense(amountSpent: "¥5400", product: "9月存款产品", productIcon: "gift.circle", spendType: "银行卡支付"),
    Expense(amountSpent: "¥9900", product: "6月存款产品", productIcon: "gift.circle", spendType: "支付宝"),
]

