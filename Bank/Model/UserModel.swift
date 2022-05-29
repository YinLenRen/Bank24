//
//  UserModel.swift
//  Bank
//
//  Created by FFF on 2022/3/25.
//

import Foundation


class UserModel: BaseJSON, ObservableObject{
    
    var userId: Int!
    
    var realName: String!

    var phone: String!

    var password:String!

    var lastLogin: Date!
    
    var documentCode: String!
    
    var sex: Int!
    
    var nativePlace: String!
    
    var email: String!
    
    var documentType: String!
    
}
