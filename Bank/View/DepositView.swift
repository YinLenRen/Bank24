//
//  DepositView.swift
//  Bank
//
//  Created by FFF on 2022/1/22.
//

import SwiftUI
import HandyJSON

struct DepositView: View {
    
    @Binding var isActive: Bool
    
    @State var flag = false
    
//    @StateObject var deposits = DepositModel()
    @State var depositsDoubleGroup = DepositGroup()
//    @State var deposits = DeModel()
    
    var body: some View {
        VStack{
            //MARK: - 定期存款
            /*
             List(){
             Section(header: Text("定期存款")
             .font(.system(size: 20))
             .bold()) {
                 ForEach(self.deposits){ item in
             ZStack{
             NavigationLink(destination: ProduceDetailView(isActive:$isActive)) {
             EmptyView()
             }
             .opacity(0)
             VStack{
                 Text(item.productName)
             .font(.system(size: 18))
             .bold()
             .padding(EdgeInsets(top: 10, leading: -155, bottom: 0, trailing: 0))
             HStack{
             Text(item.annualRate)
             .font(.system(size: 25))
             .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
             .bold()
             Text("%")
             .font(.system(size: 15))
             .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
             .bold()
             .padding(.leading, -8)
             Spacer()
             Text(item.deadlineTime)
             }
             Text("年利率")
             .foregroundColor(.gray)
             .font(.system(size: 15))
             .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 260))
             
             }
             
             
             }
             
             }
             if flag == false {
             HStack{
             Text("展开")
             .foregroundColor(Color.gray)
             Image(systemName: "chevron.compact.down")
             .resizable()
             .foregroundColor(Color.gray)
             .frame(width: 10, height: 10)
             }
             
             .padding(.leading, 130)
             .onTapGesture {
             flag = true
             
             
             
             }
             }
             if flag == true{
                 ForEach(self.deposits){ item in
             ZStack{
             NavigationLink(destination: ProduceDetailView(isActive: $isActive)) {
             EmptyView()
             }
             .opacity(0)
             VStack{
             Text(item.productName)
             .font(.system(size: 18))
             .bold()
             .padding(EdgeInsets(top: 10, leading: -155, bottom: 0, trailing: 0))
             HStack{
             Text(item.annualRate)
             .font(.system(size: 25))
             .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
             .bold()
             Text("%")
             .font(.system(size: 15))
             .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
             .bold()
             .padding(.leading, -8)
             Spacer()
             Text(item.deadlineTime)
             }
             Text("年利率")
             .foregroundColor(.gray)
             .font(.system(size: 15))
             .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 260))
             
             }
             
             
             }
             
             }
             
             HStack{
             Text("折叠")
             .foregroundColor(Color.gray)
             Image(systemName: "chevron.compact.up")
             .resizable()
             .foregroundColor(Color.gray)
             .frame(width: 10, height: 10)
             }
             .padding(.leading, 130)
             .onTapGesture {
             flag = false
             
             }
             }
             
             }
             */
            DingqiView(isActive: $isActive)
                .onAppear {
                    BankApi.shared.deposit(status: 0).subscribe(onNext: { response in
                        depositsDoubleGroup.depositGroup = response.data
//                        deposits = response.data[0]
//                        deposits = response.data[1]
//                        deposits = response.data
//                        for i in 0...1{
////                            deposits = response.data[i]
//                            depositsGroup.append(response.data[i])
//                            print(depositsGroup[i].productName!)
//                        }
                            
    
//                        print((response.data[0].toJSONString())!)
//                        let deposits = JSONDeserializer<DepositModel>.deserializeFrom(json: (response.data.toJSONString())!) {
//                            print(deposits.productId!)
//                            print(deposits.productName!)
//                            print(deposits.annualRate!)
//                            print(deposits.deadlineTime!)
                        
                        

                    }, onError: nil, onCompleted: nil, onDisposed: nil)
                }
                .environmentObject(depositsDoubleGroup)
                
            
            //MARK: - 通知存款
            /*
            Section(header: Text("通知存款")
                        .font(.system(size: 20))
                        .bold() ) {
                
                ForEach(deposits){ item in
                    VStack{
                        Text(item.name)
                            .font(.system(size: 18))
                            .bold()
                            .padding(EdgeInsets(top: 10, leading: -155, bottom: 0, trailing: 0))
                        HStack{
                            Text(item.rate)
                                .font(.system(size: 25))
                                .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                .bold()
                            Text("%")
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                .bold()
                                .padding(.leading, -8)
                            Spacer()
                            Text(item.limit)
                        }
                        Text("年利率")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 260))
                        
                    }
                }
            }
             */
        }

        .navigationBarTitle(("存款产品"), displayMode: .inline)
        
    }
    
    //        .navigationBarTitle("存款", displayMode: .inline)
}


struct DepositView_Previews: PreviewProvider {
    static var previews: some View {
        DepositView(isActive: .constant(true))
        
    }
    
}
