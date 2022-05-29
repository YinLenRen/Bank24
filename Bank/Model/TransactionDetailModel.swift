//
//  TransactionDetailModel.swift
//  Bank
//
//  Created by 许丰炼 on 2022/3/23.
//

import Foundation
import SwiftUI

class TransactionDetailModel:BaseJSON, Identifiable{
    var id = UUID()
    var productName: String!
    var valueTime: String!
    var payMoney: String!
//    init(productName:String,date:String,money:String){
//        self.productName = ""
//        self.date=""
//        self.money=""
//    }
}

//let transactions = [
//    TransactionDetailModel(productName:"6月定期产品",date:"2022/03/21",money:"5000"),
//    TransactionDetailModel(productName:"9月定期产品",date:"2022/01/21",money:"8000"),
//    TransactionDetailModel(productName:"12月定期产品",date:"2022/02/22",money:"9000")
//]
