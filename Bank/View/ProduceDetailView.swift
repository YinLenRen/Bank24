//
//  ProduceDetailView.swift
//  Bank
//
//  Created by FFF on 2022/1/22.
//

import SwiftUI

struct ProduceDetailView: View {
    
    private let TITLES = ["计息规则", "存入规则", "支取规则"]
    private let TITLE_SPACING = 10.0
    private let pwidth: CGFloat  = UIScreen.main.bounds.size.width
    
    @State private var selectedIndex = 0
    
    var item: DepositModel
    
    @State var flag = 1
    
    @State var price:Double = 0
    
    @Binding var isActive: Bool
    
    @State var showingModal = false
    
    @State var rateFlag = 0
    
    
    //    @State var currentTime :Date
    //    @Binding var deposit : DepositModel
    
    var body: some View {
        VStack{
//        ScrollView(.vertical){
            //MARK: - 详情
//            ZStack{
                
                //                Image("red")
                //                    .resizable()
                //                    .frame(width: 390, height: 200)
                //                    .cornerRadius(8.0)
                ZStack{
                    
                    Rectangle()
                        .fill(.white)
                        .frame(width: 350, height: 150)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 1, x: 1, y: 1)
                    
                    VStack{
                        Text(item.productName)
                            .font(.system(size: 20))
                            .padding(EdgeInsets(top: -20, leading: -155, bottom: 0, trailing: 0))
                        
                        HStack{
                            HStack{
                                Image(systemName: "checkmark.shield")
                                    .resizable()
                                    .frame(width: 15, height: 20)
                                    .foregroundColor(.blue)
                                Text("保本保息")
                                    .font(.system(size: 15))
                                    .foregroundColor(.blue)
                            }
                            //                            .overlay(
                            //                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                            //                                    .stroke(Color.blue, lineWidth: 1)
                            //
                            //                            )
                            Text("当日起息")
                                .font(.system(size: 15))
                                .foregroundColor(.blue)
                            Text("随存随取")
                                .font(.system(size: 15))
                                .foregroundColor(.blue)
                        }
                        .padding(EdgeInsets(top: -10, leading: -90, bottom: 0, trailing: 0))
                        HStack{
                            Text(item.annualRate)
                                .font(.system(size: 30))
                                .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                .bold()
                            Text("%")
                                .font(.system(size: 15))
                                .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                                .bold()
                                .padding(.leading, -8)
                            HStack{
                                Text("产品期限")
                                    .foregroundColor(.gray)
                                //
                                HStack{
                                    Text(item.deadlineTime)
                                    Text("个月")
                                }
                                
                                //
                            }
                            .padding(.leading, 120)
                        }
                        HStack{
                            Text("年利率")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                            HStack{
                                Text("起存金额")
                                    .foregroundColor(.gray)
                                Text(item.beginMoney + "元")
                                
                            }
                            .padding(.leading, 150)
                        }
                        
                    }
                }
//                .padding(.top, 150)
                
                
//            }
//            .padding(.top, -150)
            //MARK: - 存款亮点
            ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(width: 350, height: 130)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 1, y: 1)
                
                VStack{
                    Text("存款亮点")
                        .bold()
                        .padding(EdgeInsets(top: -10, leading: -160, bottom: 10, trailing: 0))
                    HStack{
                        ZStack{
                            Rectangle()
                                .fill(.secondary)
                                .frame(width: 65, height: 30)
                                .cornerRadius(10)
                            Text("当日起息")
                            //                            .overlay(
                            //                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                            //                                    .stroke(Color.gray, lineWidth: 2)
                            //                            )
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            //                                .background(Color.gray)
                            
                        }
                        Text("每日22:00前存入， 当日起息(含节假日)")
                            .font(.system(size: 14))
                    }
                    .padding(.bottom, 10)
                    HStack{
                        ZStack{
                            Rectangle()
                                .fill(.secondary)
                                .frame(width: 65, height: 30)
                                .cornerRadius(10)
                            Text("随存随取")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .background(Color.gray)
                        }
                        Text("任意自然日存入，支持提前支取")
                            .font(.system(size: 14))
                    }
                    .padding(.leading, -50)
                }
            }
            .padding(.top, 20)
            
            //MARK: - 交易规则
            VStack(alignment:.leading){
                
                Text("交易规则")
                    .font(.system(size: 20))
                    .bold()
            }.padding(.leading,-170)
//                .padding(EdgeInsets(top: 20, leading: -170, bottom: 0, trailing: 0))
            VStack{
                HStack{
                    VStack{
                        //                        Text("\(Date())")
                        Text("\(Date().formatDate1())")
                            .font(.system(size: 13))
                        //                            .onAppear{
                        //                                print(Date())
                        //                            }
                        Text("预计起息日")
                            .font(.system(size: 13))
                    }
                    .foregroundColor(.red)
                    .offset(y: 15)
                    .padding(.leading, -10)
                    
                    VStack{
                        Text("\(Date().formatDate2())")
                            .font(.system(size: 13))
                        Text("到期日")
                            .font(.system(size: 13))
                    }
                    .offset(y: 15)
                    .padding(.leading, 55)
                    
                    VStack{
                        Text("到期日24点前")
                            .font(.system(size: 13))
                        Text("本息到账")
                            .font(.system(size: 13))
                    }
                    .offset(y: 15)
                    .padding(.leading, 20)
                }
                HStack{
                    Rectangle().fill(.red).frame(width: 1, height: 15)
                        .padding(.leading, 0)
                        .offset(y: 10)
                    
                    Rectangle().fill(.gray).frame(width: 1, height: 15)
                        .padding(.leading, 229)
                        .offset(y: 10)
                    
                    Rectangle().fill(.gray).frame(width: 1, height: 15)
                        .padding(.leading, 99)
                        .offset(y: 10)
                }
                HStack{
                    
                    ZStack{
                        Rectangle().fill(Color(red: 238/255, green: 59/255, blue: 59/255)).frame(width: 230, height: 20, alignment: .center)//.offset(y: -10)
                        Text("持有期" + item.deadlineTime + "个月")
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                    
                    Rectangle().fill(.gray).frame(width: 110, height: 20, alignment: .center)//.offset(y: -10)
                    
                }
                VStack {
                    //MARK: - 顶部导航栏
                    VStack {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: TITLE_SPACING) {
                                ForEach(0 ..< TITLES.count ) { index in
                                    Text(TITLES[index])
                                        .fontWeight(selectedIndex == index ? .bold : nil)
                                        .foregroundColor(selectedIndex == index ? Color.red : nil)
                                        .font(Font.system(size: 16))
                                        .frame(height: 30)
                                        .frame(maxWidth: .infinity)
                                        .onTapGesture {
                                            self.selectedIndex = index;
                                        }
                                }
                            }
                            
                            GeometryReader { geometry in
                                let itemFullWidth = (geometry.size.width - CGFloat(TITLES.count - 1) * TITLE_SPACING) / CGFloat(TITLES.count) // <- 包含空白
                                let itemStartX = (itemFullWidth  + TITLE_SPACING) * CGFloat(selectedIndex)
                                let currentWidth = TITLES[selectedIndex].width(withConstrainedHeight: 100, font: UIFont.systemFont(ofSize: 16)) // <- 实际文字宽度
                                
                                Capsule()
                                    .fill(Color.red)
                                    .frame(height: 2)
                                    .frame(width: currentWidth)
                                    .offset(x: itemStartX + (itemFullWidth - currentWidth) / 2.0)
                                    .animation(.default, value: selectedIndex)
                            }.frame(height: 2)
                            
                            
                            
                        }.background(Color.white)
                    }.padding()
                    //MARK: - 具体页面
                    TabView(selection: $selectedIndex) {
                        //                        ForEach(0 ..< TITLES.count) {index in
                        if selectedIndex == 0{
                        VStack(alignment: .leading){
                        
                        HStack(alignment: .firstTextBaseline){
                        Text("提前支取收益：")
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                        Text("支持提前支取，提前支取部分按支取日我行活期存款利率计息，其余部分到期按存入日约定利率计息")
                        .font(.system(size: 18))
                        .frame(alignment: .leading)
                        .foregroundColor(.gray)
                        }
                        HStack(alignment: .firstTextBaseline){
                        Text("满期综合收益：")
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                        Text("持有满期按存入日约定利率计息")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        }
                        }
                        .frame( height: 140, alignment: .top)
                        .padding(.top,40)
                        }
                        
                        if selectedIndex == 1{
                        VStack(alignment: .leading){
                        HStack(alignment: .firstTextBaseline){
                        Text("起存金额:")
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                        //                                .padding(.leading, -113)
                        Text("50元起存，0.01元递增")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        //                                .padding(.leading, -50)
                        }
                        //                    .padding(.leading, -170)
                        
                        HStack(alignment: .firstTextBaseline){
                        Text("存入时间:")
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                        Text("任意自然日存入，22:00前存入当日起息，当日取出不计息")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        }
                        }
                        .frame( height: 105, alignment: .top)
                        }
                        
                        if selectedIndex == 2{
                        VStack(alignment: .leading){
                        HStack{
                        Text("提前支取:")
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                        
                        Text("支持全额提前支取与部分提前支取")
                        .font(.system(size: 18))
                        .frame(alignment: .leading)
                        .foregroundColor(.gray)
                        }
                        //                    .padding(.leading, -100)
                        
                        HStack{
                        Text("到账时间:")
                        .bold()
                        .font(.system(size: 18))
                        .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
                        
                        Text("当日到账，以银行到账时间为准")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        }
                        //                    .padding(.leading, -114)
                        
                        }
                        .frame(height: 105, alignment: .top)
                        }
                        //                        }
                    }
                    //           .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
            }
            /*
             HStack{
             Text("计息规则")
             .foregroundColor(flag == 1 ? Color(red: 205/255, green: 0/255, blue: 0/255) : .black)
             
             .onTapGesture {
             flag = 1
             }
             Rectangle().fill(Color.gray).frame(width: 1, height: 14, alignment: .center).padding(.leading, 15.5)//.offset(y: -10)
             //                    .padding(.trailing,20)
             Text("存入规则")
             .foregroundColor(flag == 2 ? Color(red: 205/255, green: 0/255, blue: 0/255) : .black)
             
             .onTapGesture {
             flag = 2
             }
             Rectangle().fill(Color.gray).frame(width: 1, height: 14, alignment: .center).padding(.leading, 15.5)//.offset(y: -10)
             //                    .padding(.trailing,20)
             Text("支取规则")
             .foregroundColor(flag == 3 ? Color(red: 205/255, green: 0/255, blue: 0/255) : .black)
             
             .onTapGesture {
             flag = 3
             }
             }
             .padding(.top, 10)
             .padding(.leading, -50)
             
             if flag == 1{
             VStack(alignment: .leading){
             
             HStack(alignment: .firstTextBaseline){
             Text("提前支取收益：")
             .bold()
             .font(.system(size: 18))
             .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
             Text("支持提前支取，提前支取部分按支取日我行活期存款利率计息，其余部分到期按存入日约定利率计息")
             .font(.system(size: 18))
             .frame(alignment: .leading)
             .foregroundColor(.gray)
             }
             HStack(alignment: .firstTextBaseline){
             Text("满期综合收益：")
             .bold()
             .font(.system(size: 18))
             .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
             Text("持有满期按存入日约定利率计息")
             .font(.system(size: 18))
             .foregroundColor(.gray)
             }
             }
             .frame( height: 165, alignment: .top)
             }
             
             if flag == 2{
             VStack(alignment: .leading){
             HStack(alignment: .firstTextBaseline){
             Text("起存金额:")
             .bold()
             .font(.system(size: 18))
             .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
             //                                .padding(.leading, -113)
             Text("50元起存，0.01元递增")
             .font(.system(size: 18))
             .foregroundColor(.gray)
             //                                .padding(.leading, -50)
             }
             //                    .padding(.leading, -170)
             
             HStack(alignment: .firstTextBaseline){
             Text("存入时间:")
             .bold()
             .font(.system(size: 18))
             .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
             Text("任意自然日存入，22:00前存入当日起息，当日取出不计息")
             .font(.system(size: 18))
             .foregroundColor(.gray)
             }
             }
             .frame( height: 165, alignment: .top)
             }
             
             if flag == 3{
             VStack(alignment: .leading){
             HStack{
             Text("提前支取:")
             .bold()
             .font(.system(size: 18))
             .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
             
             Text("支持全额提前支取与部分提前支取")
             .font(.system(size: 18))
             .frame(alignment: .leading)
             .foregroundColor(.gray)
             }
             //                    .padding(.leading, -100)
             
             HStack{
             Text("到账时间:")
             .bold()
             .font(.system(size: 18))
             .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
             
             Text("当日到账，以银行到账时间为准")
             .font(.system(size: 18))
             .foregroundColor(.gray)
             }
             //                    .padding(.leading, -114)
             
             }
             .frame(height: 165, alignment: .top)
             }
             */
            
            //            //MARK: - 计算器
            //            ZStack{
            //                HStack{
            //                    Image(systemName: "plus.forwardslash.minus")
            //                        .resizable()
            //                        .frame(width: 40, height: 40)
            //                        .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
            //                        .padding(.leading, -5)
            //                        .onTapGesture {
            //                            showingModal = !showingModal
            //                        }
            //  Text("计算器")
            //
            //                    Button("立即存入") {
            //
            //                    }
            //                    .font(.system(size: 25))
            //                    .foregroundColor(.white)
            //                    .frame(width: 270, height: 50 )
            //                    .background(Color(red: 205/255, green: 38/255, blue: 38/255))
            //                    .cornerRadius(20)
            //                    .shadow(radius: 5)
            //                    .padding(.leading, 40)
            //MARK: - 完成按钮
            
            Button(action:{
                print(isActive)
            }){
                NavigationLink(destination: BuyView(item: item, isActive: $isActive, money: "")){
                    HStack{
                        Spacer()
                        Text("立即存入")
                        Spacer()
                    } .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(50)
                    
                    
                }
            }
            
//        }
        .navigationTitle("产品详情")
        //        .padding(.top, 100)
        //                .padding(.bottom, -100)
        //                if $showingModal.wrappedValue{
        ////                    KeyPadView()
        //                    ZStack{
        //            //              .black.opacity(0)
        //            //              .edgesIgnoringSafeArea(.vertical)
        //                        VStack(spacing: 20) {
        //                            HStack{
        //                                Image(systemName: "multiply")
        //                                    .resizable()
        //            //                        .foregroundColor(.gray)
        //                                    .frame(width: 15, height: 15)
        //                                    .padding(.leading, -100)
        //                                    .onTapGesture {
        //                                       showingModal = false
        //                                    }
        //                                Text("利息计算器")
        //                            }
        //
        //
        //                            VStack{
        //
        //                                HStack{
        //                                    Text("￥")
        //                                    TextField("50元起存，0.01元递增",value:$price,format: .number.precision(.fractionLength(2)))
        //                                        .keyboardType(.decimalPad) //支持小数点的数字键盘
        //                                        .onTapGesture {
        //                                            rateFlag = 1
        //                                        }
        //                                }
        //                                .font(.system(size: 25))
        //                                .padding(.leading, 30)
        //                                Rectangle().fill(Color(red: 211/255, green: 211/255, blue: 211/255)).frame(width: 350, height: 1, alignment: .center).padding(.leading, 15.5)//.offset(y: -10)
        //                                if rateFlag == 1{
        //
        //                                    HStack{
        //                                        Text("产品到期后派息")
        //                                        TextField("Price", value: $price, format: .number.precision(.fractionLength(2)))
        //                                            .foregroundColor(Color(red: 205/255, green: 38/255, blue: 38/255))
        //                                            .padding(.leading, 140)
        //                                        Text("元")
        //                                            .padding(.leading, -30)
        //                                    }
        //                                    .padding(.leading, 30)
        //                                }
        //
        //                            }
        //
        //                            .frame(height: 150)
        //
        //                            //MARK: - 计算器存入按钮
        //                            Button(action:{
        //                                print(isActive)
        //                            }){
        //                                NavigationLink(destination: BuyView(isActive: $isActive)){
        //                                    HStack{
        //                                        Spacer()
        //                                        Text("立即存入")
        //                                        Spacer()
        //                                    } .padding()
        //                                        .foregroundColor(.white)
        //                                        .background(Color.red)
        //                                        .cornerRadius(50)
        //                                }
        //                            }.padding()
        ////                            .font(.system(size: 25))
        ////                            .foregroundColor(.white)
        ////                            .frame(width: 250, height: 50 )
        ////                            .background(Color(red: 205/255, green: 38/255, blue: 38/255))
        ////                            .cornerRadius(20)
        ////                            .shadow(radius: 5)
        //                        }
        //                        .background(Color.white)
        //                    }
        //                }
        //            }
        //
        //
        //        }
        //
        //    }
    }
    }
}


//
//struct ProduceDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProduceDetailView(isActive: .constant(true),deposit: .constant(DepositModel()))
//    }
//}

extension Date {
    func formatDate1() -> String {
        let formatter = DateFormatter()
        formatter.locale = .init(identifier: "zh-CN")
        formatter.dateStyle = .medium
        //            formatter.timeStyle = .medium
        let nowdate = formatter.string(from: Date())
        return nowdate
    }
    func formatDate2() -> String {
        let formatter = DateFormatter()
        formatter.locale = .init(identifier: "zh-CN")
        formatter.dateStyle = .medium
        //            formatter.timeStyle = .medium
        let nowdate = formatter.string(from: Calendar.current.date(byAdding: .month, value: 6, to: .now)!)
        return nowdate
    }
}

