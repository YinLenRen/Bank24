//
//  BankService.swift
//  Bank
//
//  Created by FFF on 2022/3/4.
//

import Foundation

//导入网络框架
import Moya

/// 定义项目中的所有接口
///

enum BankService {
    case testInt(flag: Int)
    case deposit(status: Int)
    case addBankDepositOrder(Dict: [String: Any])
    case selectBankRemain(id: Int)
    case login(Dict: [String: Any])
    case selectBankUserDetailsByUserId(userId: Int)
    case selectBankDepositOrderByIndex(Dict: [String: Any])
    case register(Dict: [String: Any])
}

// MARK: - 实现TargetType协议
extension BankService: TargetType {
    
    /// 返回网址
    //    var baseURL: URL{
    //        return URL(string: "https://httpbin.org")!
    //    }
    var baseURL: URL{
        return URL(string: "http://192.168.137.192:8080")!
    }
    
    /// 返回每个请求的路径
    var path: String{
        switch self {
        case .testInt(_):
            return "/provider/test1"
        case .deposit(_):
            return "/provider/selectAllBankDepositProductApp"
        case .addBankDepositOrder:
            return "/provider/addBankDepositOrder"
        case .selectBankRemain(_):
            return "/provider/selectBankRemain"
        case .login:
            return "/provider/login"
        case .selectBankUserDetailsByUserId(_):
            return "/provider/selectBankUserDetailsByUserId"
        case .selectBankDepositOrderByIndex:
            return "/provider/selectBankDepositOrderByIndex"
        case .register:
            return "/provider/register"
        default:
            return ""
        }
    }
    
    /// 请求方式
    var method: Moya.Method {
        switch self {
        case .addBankDepositOrder(_):
            return .post
        case .login(_):
            return .post
        case .register(_):
            return .post
        default:
            return .get
        }

    }
    
    /// 返回测试相关的数据
    var sampleData: Data {
        return Data()
    }
    
    /// 请求的参数
    var task: Task {
        switch self {
        case .testInt(let flag):
            return ParamUtil.urlRequestParamters(["flag": flag])
        case .deposit(let status):
            return ParamUtil.urlRequestParamters(["status": status])
        case let .addBankDepositOrder(Dict: dict):
            return ParamUtil.urlRequestParamtersToJSON(dict)
        case .selectBankRemain(let id):
            return ParamUtil.urlRequestParamters(["id": id])
        case let .login(Dict: dict):
            return ParamUtil.urlRequestParamtersToJSON(dict)
        case .selectBankUserDetailsByUserId(let userId):
            return ParamUtil.urlRequestParamters(["userId": userId])
        case let .selectBankDepositOrderByIndex(Dict: dict):
            return ParamUtil.urlRequestParamters(dict)
        case let .register(Dict: dict):
            return ParamUtil.urlRequestParamtersToJSON(dict)
        default:
            //不传递任何参数
            return .requestPlain
        }
        
    }
    
    /// 请求头
    var headers: [String : String]? {
        
        return ["user-agent" : "macos"]
    }


}
