//
//  HomeView.swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/19.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isActive:[Bool] = Array(repeating: false, count: 12)
    
    private let homeBannerModel: HomeBannerModel = HomeBannerModel()
    
    @State var deposit1 = DepositModel()
    @State var deposit2 = DepositModel()
    @State var deposit3 = DepositModel()
    
    var body: some View {
        ScrollView(.vertical) {
            //MARK: - 顶部图片
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8.0)
            //MARK: - 中间三个功能
            ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(width: 320, height: 100)
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
                HStack{
                    NavigationLink(destination: MyAccountView(isActive: $isActive[0]),isActive: $isActive[0]){
                        EmptyView()
                    }
                    VStack {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width:25,height:25)
                            .foregroundColor(.blue).padding()
                        Text("我的账户")
                        
                    }.onTapGesture{ isActive[0] = true}
                    .padding()
//                    NavigationLink(destination: BuySuccessView(isActive: $isActive[1]),isActive: $isActive[1]){
//                        EmptyView()
//                    }
                    VStack {
                        Image(systemName: "arrow.left.arrow.right.circle")
                            .resizable()
                            .frame(width:25,height:25)
                            .foregroundColor(.yellow)
                            .padding()
                        Text("转账")
                        
                    }.onTapGesture {
                        isActive[1] = true
                    }
                    .padding()
                    NavigationLink(destination: TransactionDetailsView(isActive: $isActive[2]),isActive: $isActive[2]){
                        EmptyView()
                    }
                    VStack {
                        Image(systemName: "note.text")
                            .resizable()
                            .frame(width:25,height:25)
                            .foregroundColor(.pink)
                            .padding()
                        Text("明细")
                    }.onTapGesture {
                        isActive[2] = true
                    }
                    .padding()
                }
            }
            .padding(-55)
            //MARK: - 中间五个功能
            
            HStack {
                NavigationLink(destination: AddBankCardView(isActive: $isActive[3]),isActive:$isActive[3]){
                    EmptyView()
                }
                VStack {
                    Image(systemName: "creditcard")
                        .resizable()
                        .frame(width:25,height:25)
                        .foregroundColor(.blue)
                        .padding()
                    Text("绑卡")
                        .frame(width:60)
                }.onTapGesture {
                    isActive[3] = true
                }
                NavigationLink(destination: DepositView(isActive: $isActive[4]),isActive:$isActive[4]){
                    EmptyView()
                }
                VStack {
                    Image(systemName: "yensign.circle")
                        .resizable()
                        .frame(width:25,height:25)
                        .foregroundColor(.orange)
                        .padding()
                    Text("存款")
                        .frame(width:40)
                }.onTapGesture {
                    isActive[4] = true
                }
                NavigationLink(destination: DepositView(isActive: $isActive[5]),isActive:$isActive[5]){
                    EmptyView()
                }
                VStack {
                    Image(systemName: "square.3.stack.3d")
                        .resizable()
                        .frame(width:25,height:25)
                        .foregroundColor(.green)
                        .padding()
                    Text("理财产品")
                        .frame(width:80)
                }
                .onTapGesture {
                    isActive[5] = true
                }
                NavigationLink(destination: TestView1(isActive: $isActive[6]),isActive:$isActive[6]){
                    EmptyView()
                }
                VStack {
                    Image(systemName: "gift")
                        .resizable()
                        .frame(width:25,height:25)
                        .foregroundColor(.red)
                        .padding()
                    Text("活动")
                    //                        .frame(width:40)
                }
                .onTapGesture {
                    isActive[6] = true
                }
                NavigationLink(destination: DepositView(isActive: $isActive[7]),isActive:$isActive[7]){
                    EmptyView()
                }
                VStack {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .frame(width:25,height:25)
                        .foregroundColor(.purple)
                        .padding()
                    Text("全部")
                        .frame(width:40)
                }
                .onTapGesture {
                    isActive[7] = true
                }
                
            }
            .padding(EdgeInsets(top: 55, leading: 0, bottom: 55, trailing: 0))
            //MARK: - 中间轮播图
            HStack{
                HomeBannerView()
                    .environmentObject(homeBannerModel)
            }.frame(width:360,height:150,alignment: .top)
            //MARK: - 存款产品
            ZStack(alignment:.topTrailing){
                Rectangle()
                    .fill(.white)
                    .frame(width: 390, height: 250)
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 2, x: 1, y: 1)
                //MARK: - 更多按钮
                HStack{
                    NavigationLink(destination: DepositView(isActive: $isActive[8]),isActive: $isActive[8]){
                        EmptyView()
                    }
                    Text("更多")
                        .foregroundColor(.secondary)
                        .fontWeight(.bold)
                }
                .onTapGesture {
                    isActive[8] = true
                }
                .padding()
                Text("存款")
                    .font(.title2)
                    .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 315))
                //具体存款产品
                ZStack(alignment:.topTrailing){
                    HStack{
                        VStack{
                            
                            NavigationLink(destination:ProduceDetailView(item: deposit1,  isActive: $isActive[9]), isActive: $isActive[9]) {
                                EmptyView()
                            }
                            .onAppear
                            {
                                deposit1.annualRate = "1"
                                deposit1.beginMoney = "50"
                                deposit1.id = 1
                                deposit1.productId = "1"
                                deposit1.deadlineTime = "6"
                                deposit1.productName = "6个月定期存款"
                            }
                            Rectangle()
                                .fill(.white)
                                .frame(width: 100, height: 150)
                                .cornerRadius(15)
                                .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 20))
                                .shadow(color: .gray, radius: 2, x: 1, y: 1)
                            VStack{
                                
                                Text("整存整取")
                                    .font(.title3)
                                    .bold()
                                    .padding(EdgeInsets(top: -140, leading: 0, bottom: 0, trailing: 20))
                                Text("部分提前支取")
                                    .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                    .font(.system(size: 12))
                                    .background(Color(red: 255/255, green: 193/255, blue: 193/255))
                                    .padding(EdgeInsets(top: -130, leading: 0, bottom: 0, trailing: 20))
                                Text("年利率")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .padding(EdgeInsets(top: -120, leading: 0, bottom: 0, trailing: 20))
                                Text("1.55%")
                                    .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                    .bold()
                                    .font(.system(size: 25))
                                    .padding(EdgeInsets(top: -115, leading: 0, bottom: 0, trailing: 20))
                                
                                Text("12月定期产品")
                                    .font(.system(size: 13))
                                    .padding(EdgeInsets(top: -100, leading: 0, bottom: 0, trailing: 20))
                            }
                        }
                        .onTapGesture {
                            isActive[9] = true
                        }
                        
                        VStack{
                            
                            NavigationLink(destination:ProduceDetailView(item: deposit2,  isActive: $isActive[10]), isActive: $isActive[10]) {
                                EmptyView()
                            }
                            .onAppear
                            {
                                deposit2.annualRate = "1"
                                deposit2.beginMoney = "50"
                                deposit2.id = 2
                                deposit2.productId = "2"
                                deposit2.deadlineTime = "12"
                                deposit2.productName = "12个月定期存款"
                            }
                            
                            Rectangle()
                                .fill(.white)
                                .frame(width: 100, height: 150)
                                .cornerRadius(15)
                                .shadow(color: .gray, radius: 2, x: 1, y: 1)
                                .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 20))
                            VStack{
                                
                                Text("整存整取")
                                    .font(.title3)
                                    .bold()
                                    .padding(EdgeInsets(top: -140, leading: 0, bottom: 0, trailing: 20))
                                Text("部分提前支取")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                    .background(Color(red: 255/255, green: 193/255, blue: 193/255))
                                    .padding(EdgeInsets(top: -130, leading: 0, bottom: 0, trailing: 20))
                                Text("年利率")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .padding(EdgeInsets(top: -120, leading: 0, bottom: 0, trailing: 20))
                                Text("1.75%")
                                    .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                    .bold()
                                    .font(.system(size: 25))
                                    .padding(EdgeInsets(top: -115, leading: 0, bottom: 0, trailing: 20))
                                
                                Text("6月定期产品")
                                    .font(.system(size: 13))
                                    .padding(EdgeInsets(top: -100, leading: 0, bottom: 0, trailing: 20))
                            }
                            
                        }
                        .onTapGesture {
                            isActive[10] = true
                        }
                        
                        VStack{
                            
                            NavigationLink(destination:ProduceDetailView(item: deposit3,  isActive: $isActive[11]), isActive: $isActive[11]) {
                                EmptyView()
                            }
                            .onAppear
                            {
                                deposit3.annualRate = "1"
                                deposit3.beginMoney = "50"
                                deposit3.id = 1
                                deposit3.productId = "1"
                                deposit3.deadlineTime = "6"
                                deposit3.productName = "6个月定期存款"
                            }
                            
                            Rectangle()
                                .fill(.white)
                                .frame(width: 100, height: 150)
                                .cornerRadius(15)
                                .shadow(color: .gray, radius: 2, x: 1, y: 1)
                                .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 20))
                            VStack{
                                
                                Text("整存整取")
                                    .font(.title3)
                                    .bold()
                                    .padding(EdgeInsets(top: -140, leading: 0, bottom: 0, trailing: 20))
                                Text("部分提前支取")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                    .background(Color(red: 255/255, green: 193/255, blue: 193/255))
                                    .padding(EdgeInsets(top: -130, leading: 0, bottom: 0, trailing: 20))
                                Text("年利率")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .padding(EdgeInsets(top: -120, leading: 0, bottom: 0, trailing: 20))
                                Text("2.25%")
                                    .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                    .bold()
                                    .font(.system(size: 25))
                                    .padding(EdgeInsets(top: -115, leading: 0, bottom: 0, trailing: 20))
                                
                                Text("11月定期产品")
                                    .font(.system(size: 13))
                                    .padding(EdgeInsets(top: -100, leading: 0, bottom: 0, trailing: 20))
                            }
                            
                        }
                        .onTapGesture {
                            isActive[11] = true
                        }
                        
                    }
                    
                    
                }
            }
            .padding(EdgeInsets(top: 40, leading: 0, bottom: 40, trailing: 0)
            )
        }
    }
}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

