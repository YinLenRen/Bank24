//
//  DepositModel.swift
//  Bank
//
//  Created by FFF on 2022/1/22.
//

import Foundation

class DepositModel: BaseJSON, Identifiable, ObservableObject{
    var id: Int!
    var productId: String!
    var productName: String!
    var annualRate: String!
    var deadlineTime: String!
    var beginMoney: String!
}
//let jsonString = "{\"productId\":\"1\",\"productName\":\"存款产品\",\"annualRate\":3,\"deadlineTime\":\"5\"}"

//let deposits = [
//    DepositModel(productName: "3个月定期存款", annualRate: "1.5500", deadlineTime: "期限3个月"),
//    DepositModel(productName: "6个月定期存款", annualRate: "2.0500", deadlineTime: "期限6个月"),
//    DepositModel(productName: "1年定期存款", annualRate: "2.2500", deadlineTime: "期限1年"),
//    DepositModel(name: "", rate: "", limit: "")
//]


