//
//  BankDepositOrder.swift
//  Bank
//
//  Created by FFF on 2022/3/10.
//

import Foundation

class BankDepositOrder: BaseJSON,Identifiable{
    var productId: String!
    var productName: String!
    var annualRate: String!
    var deadlineTime: String!
    var beginMoney: String!
    var userId: String!
    var cardId: String!
    
}
