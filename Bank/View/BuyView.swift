//
//  BuyView.swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/22.
//

import SwiftUI


struct BuyView: View {
    
    var item: DepositModel
    
    @Binding var isActive:Bool
    
    @State var money: String = ""
    
    @State var bankCard = BankCard()
    
//   @State private var flag : Bool
    
    @EnvironmentObject var wallet:Wallet
    
    var body: some View {
        ZStack(alignment:.top){
//            ZStack{
//                Rectangle()
//                    .fill(.white)
//                    .frame(width: 250, height: 100)
//                    .cornerRadius(15)
//                    .shadow(color: .gray, radius: 2, x: 1, y: 1)
//                //                .padding(.top,-140)
//                VStack(alignment:.leading){
//                    HStack{
//                        Text("卡号:")
//                            .onAppear{
//                                    BankApi.shared.selectBankRemain(id: item.id).subscribe(onNext: { BankCardResponce in
//
//                                    }, onError: nil, onCompleted: nil, onDisposed: nil)
//                                }
//                        Text("6236 **** **** 4313")
//                    }.padding()
//                    HStack{
//                        Text("可存入:")
//                        Text("5000000元")
//                    }.padding()
//
//                }
//            }                        .padding(.top,-140)
//            NavigationLink(destination: WalletView(wallet: ), isActive: $flag){
//                EmptyView()
//            }
            BandCardView()
                .onAppear{
                    BankApi.shared.selectBankRemain(id: item.id).subscribe(onNext: { response in
                        bankCard = response.data
                        }, onError: nil, onCompleted: nil, onDisposed: nil)
                    }
                .onTapGesture {
                    WalletView(wallet: Wallet.init(cards: cards), action: .constant(1))
                }
                .environmentObject(bankCard)
            
                
            VStack{
                VStack{
                    HStack{
                        Text("存入金额")
                            .font(.subheadline)
                            .bold()
                        Spacer()
                    }.padding(.leading,15)
                    HStack{
                        Text("¥")
                            .font(.largeTitle)
                        TextField("请输入金额",text: $money)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onTapGesture {}
                            .onLongPressGesture(
                                pressing: {
                                    isPressed in
                                    if isPressed {
                                        self.endEditing()
                                    }
                                },
                                perform: {
                                    
                                }
                            )
                        Spacer()
                    }.padding()
                    //                Rectangle()
                    //                    .fill(.white)
                    //                    .frame(height: 1)
                    //                    .shadow(color: .gray, radius: 1, y: 1)
                    //分割线
                    Divider()
                    HStack{
                        Text("预计到期利息")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
//                        Text(String((Double(money) ?? 0) * Double(item.annualRate)! / Double(100) * Double(item.deadlineTime)! / Double(12) ))
                        Text("\((Double(money) ?? 0) * Double(item.annualRate)! / 100 * Double(item.deadlineTime)! / 12, specifier:"%g")")
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .bold()
//                        Text(String((Double(money) ?? 0) * 10))
//                            .font(.subheadline)
//                            .foregroundColor(.red)
//                            .bold()
                        Text("元")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                    }.padding()
                }
                //MARK: - 中间部分信息
                VStack{
                    HStack(alignment:.top){
                        Text("存期")
                        Spacer()
                        Text(item.deadlineTime + "个月")
                        //                DisclosureGroup("3个月", isExpanded: $DateExpanded){
                        //                    VStack {
                        //                        Text("3个月").padding(.top,1)
                        //                        Text("6个月").padding(.top,1)
                        //                        Text("12个月").padding(.top,1)
                        //                    }
                        //                    .frame(maxWidth: .infinity, alignment: .leading)
                        //                }.frame(width:70)
                    }.padding()
                    HStack{
                        Text("年利率")
                        Spacer()
                        Text(item.annualRate + "%")
                            .foregroundColor(.red)
                            .bold()
                    }.padding()
                    HStack{
                        Text("到期日期")
                        Spacer()
                        Text("\(Date().formatDate2())")
                            .foregroundColor(.secondary)
                    }.padding()
                    //MARK: - 完成按钮
                    Button(action:{
                        print(isActive)
                    }){
                        NavigationLink(destination: BuySuccessView(item: item, money: money, isActive: $isActive)){
                            HStack{
                                Spacer()
                                Text("存入")
                                Spacer()
                            } .padding()
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(50)
//                                .onTapGesture{
//                                    var dict = [String: Any]()
//                                    dict["id"] = item.id
//                                    dict["productId"] = item.productId
//                                    dict["productName"] = item.productName
//                                    dict["annualRate"] = item.annualRate
//                                    dict["beginMoney"] = item.beginMoney
//                                    dict["payMoney"] = money
//                                    dict["userId"] = "1"
//                                    dict["cardId"] = "62586898753"
//
//                                    BankApi.shared.addBankDepositOrder(dict: dict).subscribe(onNext: { DepositResponce in
//                                                                    }, onError: nil, onCompleted: nil, onDisposed: nil)
//                                }
                        }
                    }.padding()
                }
            }
            //        .navigationBarTitle("3个月定期存款存入",displayMode: .inline)
        }
    }
}
extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


//struct BuyView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuyView(item isActive: .constant(true))
//    }
//}
