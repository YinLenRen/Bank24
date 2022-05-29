//
//  BaseResponce.swift
//  Bank
//
//  Created by FFF on 2022/3/3.
//

import Foundation

class BaseResponce: BaseJSON{
    var code: String!
    var msg: String!
}

class DepositResponce: BaseResponce{
    var data: [DepositModel]!
}

class BankCardResponce: BaseResponce{
    var data: BankCard!
    
}

class ContentResponce: BaseResponce{
    var data: Int!
}

class UserResponce: BaseResponce{
    var data: UserModel!
}

class TransactionDetailResponce: BaseResponce{
    var data: [TransactionDetailModel]!
}
