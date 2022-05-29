//
//  BankCardModel.swift
//  Bank
//
//  Created by FFF on 2022/3/12.
//

import Foundation

class BankCard: BaseJSON,Identifiable, ObservableObject{
    var name: String!
    var bankName: String!
    
    /*
     银行卡卡号
     */
    var bankCardid: String!
    
    var phone: String!
    
    var userId: String!
    
    /*
     银行卡余额
     */
    var remain: String!
    
}
