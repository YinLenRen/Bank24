//
//  ParamUtil.swift
//  Bank
//
//  Created by FFF on 2022/3/4.
//

import Foundation

//导入JSON解析框架
import HandyJSON

//导入网络框架
import Moya

class ParamUtil {
    /// 返回URL编码的参数
    ///
    /// - Parameter parameters: <#parameters description#>
    /// - Returns: <#return value description#>
    static func urlRequestParamters(_ parameters:[String:Any]) -> Task {
        return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
    
    static func urlRequestParamtersToJSON(_ parameters:[String:Any]) -> Task {
        return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
    }
}
