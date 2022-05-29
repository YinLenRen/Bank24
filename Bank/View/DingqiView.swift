//
//  DingqiView.swift
//  Bank
//
//  Created by FFF on 2022/3/4.
//

import SwiftUI
import RxSwift

struct DingqiView: View {
    
    @Binding var isActive: Bool
//    @State var deposit : DepositModel
    @EnvironmentObject var depositsDoubleGroup: DepositGroup
//      @EnvironmentObject var depositsGroup: [DepositModel]
    
    

    @State var flag = false
    var body: some View {
    
        List(){
            
            Section(header: Text("定期存款")
                        .font(.system(size: 20))
                        .bold()) {
//                ForEach(deposits){ item in
                ForEach(depositsDoubleGroup.depositGroup ?? []){ item in

                    ZStack{
                        NavigationLink(destination: ProduceDetailView(item:item, isActive:$isActive)) {
                            EmptyView()
                        }
//                        .onTapGesture{
//                            print(item.productName ?? "nil")
//                        }

//                        .onAppear(perform: {
//                            print("1+ \(deposits.productName ?? "0")")
//                        })
                        .opacity(0)
                        
                        VStack{
                            Text(item.productName ?? "nil")
                                .font(.system(size: 18))
                                .bold()
                                .padding(EdgeInsets(top: 10, leading: -155, bottom: 0, trailing: 0))
                            HStack{
                                Text(item.annualRate ?? "nil")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                    .bold()
                                Text("%")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                    .bold()
                                    .padding(.leading, -8)
                                Spacer()
                                Text("期限\(item.deadlineTime ?? "nil")个月")
                            }
                            Text("年利率")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 260))
                            
                        }
                        
                        
                    }
                    
                }
                //MARK: - 折叠展开
                /*
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
                    /*ForEach(deposits){ item in
                        ZStack{
                            NavigationLink(destination: ProduceDetailView(isActive: $isActive)) {
                                EmptyView()
                            }
                            .opacity(0)
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
                                
                            }*/
                            
                            
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
                 */
                }
                
            }
     
    }
        /*
        Text("hello").onTapGesture {
            print(deposits.productId!)
            print(deposits.productName!)
            print(deposits.annualRate!)
            print(deposits.deadlineTime!)
            
        }

    }
         */
}
//struct DingqiView_Previews: PreviewProvider {
//    static var previews: some View {
//       DingqiView(isActive: .constant(true))
////            .environmentObject({
////            () -> DepositModel in
////            let envObj = DepositModel()
////            return envObj
////        }())
//    }
//}
