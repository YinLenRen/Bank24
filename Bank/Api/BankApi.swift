//
//  BankApi.swift
//  Bank
//
//  Created by FFF on 2022/3/4.
//

import Foundation

//导入响应式编程框架
import RxSwift

//导入JSON解析框架
import HandyJSON

//导入网络框架
import Moya

class BankApi {
    /// 单例设计模式
    /// 饿汉式单例
    static let shared = BankApi()
    
    /// MoyaProvider
    private let provider: MoyaProvider<BankService>!
    
    /// 私有构造方法
    private init() {
        //插件列表
        var plugins:[PluginType] = []
        
        
        var configuration = NetworkLoggerPlugin.Configuration()
        configuration.logOptions = [NetworkLoggerPlugin.Configuration.LogOptions.successResponseBody]
        
//        if DEBUG {
            //表示当前是调试模式
            //添加网络请求日志插件
            plugins.append(NetworkLoggerPlugin(configuration: configuration))
//        }
        
        provider = MoyaProvider<BankService>(plugins: plugins)
    }
    
    //test
    func testInt(flag: Int) -> Observable<DepositResponce>{
        return provider
            .rx
            .request(.testInt(flag: flag))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(DepositResponce.self)
    }
    
    func deposit(status: Int) -> Observable<DepositResponce>{
        return provider
            .rx
            .request(.deposit(status: status))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(DepositResponce.self)
    }

    
    func addBankDepositOrder(dict: Dictionary<String, Any>) -> Observable<DepositResponce>{
        return provider
            .rx
            .request(.addBankDepositOrder(Dict: dict))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(DepositResponce.self)
    }
    
    func selectBankRemain(id: Int) -> Observable<BankCardResponce>{
        return provider
            .rx
            .request(.selectBankRemain(id: id))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(BankCardResponce.self)
    }
    
    func login(dict: Dictionary<String, Any>) -> Observable<ContentResponce>{
        return provider
            .rx
            .request(.login(Dict: dict))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(ContentResponce.self)
    }
    
    func selectBankUserDetailsByUserId(userId: Int) -> Observable<UserResponce>{
        return provider
            .rx
            .request(.selectBankUserDetailsByUserId(userId: userId))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(UserResponce.self)
    }
    
    func selectBankDepositOrderByIndex(dict: Dictionary<String, Any>) -> Observable<TransactionDetailResponce>{
        return provider
            .rx
            .request(.selectBankDepositOrderByIndex(Dict: dict))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(TransactionDetailResponce.self)
    }
    
    func register(dict: Dictionary<String, Any>) -> Observable<ContentResponce>{
        return provider
            .rx
            .request(.register(Dict: dict))
            .filterSuccessfulStatusCodes()
            .asObservable()
            .mapString()
            .mapObject(ContentResponce.self)
    }
}
