//
//  BuySuccessView.swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/22.
//

import SwiftUI

struct BuySuccessView: View {
    
    var item: DepositModel
    
    var money: String
    
    @Binding var isActive:Bool
    
    var body: some View {
        VStack{
            //MARK: - 上半部分
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .onAppear{
                    var dict = [String: Any]()
                    dict["id"] = item.id
                    dict["productId"] = item.productId
                    dict["productName"] = item.productName
                    dict["annualRate"] = item.annualRate
                    dict["beginMoney"] = item.beginMoney
                    dict["payMoney"] = money
                    dict["userId"] = "1"
                    dict["cardId"] = "62586898753"
                    BankApi.shared.addBankDepositOrder(dict: dict).subscribe(onNext: { DepositResponce in
                                                    }, onError: nil, onCompleted: nil, onDisposed: nil)

                }
            VStack{
                Text("交易成功")
                    .font(.title2)
                Text("¥" + money)
                    .font(.title)
                    .bold()
                    .padding(1)
                Text("购买成功，您可在\"我的财富\"中查看交易记录")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            //分割线
            Rectangle()
                .fill(.white)
                .frame(height: 1)
                .shadow(color: .gray, radius: 1, y: 1)
            //MARK: - 中间部分列表信息
            VStack{
                HStack{
                    Text("付款账号")
                    Spacer()
                    Text("6236 **** **** 4313")
                }.padding()
                HStack{
                    Text("存入金额")
                    Spacer()
                    Text(money + "元")
                }.padding()
                HStack{
                    Text("存期")
                    Spacer()
                    Text(item.deadlineTime + "个月")
                }.padding()
                HStack{
                    Text("年利率")
                    Spacer()
                    Text(item.annualRate + "%")
                }.padding()
                HStack{
                    Text("存入日期")
                    Spacer()
                    Text("\(Date().formatDate1())")
                }.padding()
                HStack{
                    Text("起始日期")
                    Spacer()
                    Text("\(Date().formatDate1())")
                }.padding()
                HStack{
                    Text("到期日期")
                    Spacer()
                    Text("\(Date().formatDate2())")
                }.padding()
                
            }
            //MARK: - 完成按钮
            Button(action:{
//                isActive = false
            }){
                NavigationLink(destination: ContentView()){
                   
                HStack{
                    Spacer()
                    Text("完成")
                    Spacer()
                } .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(50)
            }.padding()
            }
        }
        
    }
}
//
//struct BuySuccessView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuySuccessView(isActive: .constant(true))
//    }
//}
