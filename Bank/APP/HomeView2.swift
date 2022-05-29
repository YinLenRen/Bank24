//
//  HomeView2.swift
//  Bank
//
//  Created by 许丰炼 on 2022/3/28.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView2: View {
    
    @State private var isActive:[Bool] = Array(repeating: false, count: 12)
    @State private var action: [Int?] = Array(repeating: 0, count: 12)
    
    @StateObject var hudState: BenHUDState = BenHUDState()
    
    private let homeBannerModel: HomeBannerModel = HomeBannerModel()
    
    var body: some View {
        ScrollView(.vertical){
            VStack(){
                HStack(alignment: .top,spacing: 15){
                    Image("touxiang")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                    
                    
                    VStack(alignment: .leading){
                        
                        Text("欢迎回来")
                            .font(.system(size: 15) .bold())
                            .foregroundColor(.gray)
                            .padding(.bottom, 1)
                        
                        Text("蔚宝")
                            .font(.title3.bold())
                        
                    }
                    .padding(.trailing, 100)
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(.gray)
                            .overlay(
                                Text("2")
                                    .font(.caption2.bold())
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 11, y: -12),
                                
                                alignment: .topTrailing
                                
                            )
                            .offset(x: -2)
                            .padding(15)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    
                    //                HStack(alignment: .center){
                    //                    Image("custom.bell.badge")
                    //    //                    .font(.title3)
                    //                        .resizable()
                    //
                    //                        .frame(width: 20, height: 22)
                    //                }
                    //                .padding(.top, 15)
                    
                    
                }
                .padding()
                VStack{
                    Text("余额")
                        .bold()
                        .font(.title3)
                    //                        .padding(.bottom, 3)
                    
                    Text("¥74,821.00")
                        .bold()
                        .font(.largeTitle)
                        .padding(.top, 5)
                    
                    
                    HStack{
                        Image(systemName: "arrow.up.circle")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.green)
                        
                        Text("16.12%")
                            .bold()
                            .font(.system(size: 17))
                            .foregroundColor(.green)
                    }
                    .font(.caption.bold())
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    .background(
                        //                            Color(red: 224/255, green: 255/255, blue: 255/255)
                        Color(red: 224/255, green: 255/255, blue: 255/255).opacity(0.5), in: Capsule()
                    )
                    .padding(.top, 1)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.03), radius: 5, x: 5, y: 5)
                    
                    
                    
                }
                .padding()
                .padding(.horizontal, 50)
                .background(.white)
                .cornerRadius(18)
                .padding(.top, 5)
                //MARK: - 中间轮播图
                HStack{
                    HomeBannerView()
                        .environmentObject(homeBannerModel)
                }.frame(width:360,height:150,alignment: .top)
                    .padding(.bottom,20)
                HStack(spacing: 10){
                    VStack(spacing: 8){
//                        NavigationLink(destination: DepositView(isActive: $isActive[4]),isActive:$isActive[4]){
//                            EmptyView()
//                        }
                        NavigationLink(destination: DepositView(isActive: $isActive[4]),tag : 1, selection: $action[4]){
                            EmptyView()
                        }
                        Button{
                            withAnimation {
                                hudState.showWait(message: "正在请求，请稍等")

                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    hudState.showWait = false
                                    action[4] = 1
                                    isActive[4] = true
//                                    hudState.alertMessage(message: "更新失败", systemImageName: "icloud.slash")
                                }
                                
                            }
                        } label:{
                            
                            ZStack{
                                
                                Circle()
                                    .fill(Color(red: 65/255, green: 105/255, blue: 225/255))
                                    .frame(width: 65, height: 65)
                                
                                Image(systemName: "yensign.circle")
                                    .foregroundColor(.white)
                                    .font(.title)
                                
                                
                            }
                        }
//                        .onTapGesture {
//                            isActive[4] = true
//                        }
                        
                        Text("存款")
                            .bold()
                            .font(.system(size: 15))
                    }
                    .padding(.trailing)
                    
                    VStack(spacing: 8){
                        NavigationLink(destination: TransactionDetailsView(isActive: $isActive[5]),tag : 2, selection: $action[5]){
                            EmptyView()
                        }
                        Button{
                            action[5] = 2
                            isActive[5]=true
                        } label:{
                        ZStack{
                            Circle()
                                .fill(.green)
                                .frame(width: 65, height: 65)
                            
                            Image(systemName: "note.text")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        }
                        Text("明细")
                            .bold()
                            .font(.system(size: 15))
                    }
                    
                    .padding(.trailing)
                    
                    VStack(spacing: 8){
                        ZStack{
                            Circle()
                                .fill(.yellow)
                                .frame(width: 65, height: 65)
                            
                            Image(systemName: "square.3.stack.3d")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        
                        Text("理财产品")
                            .frame(width: 70)
                            .font(.system(size: 15).bold())
                    }
                    .padding(.trailing)
                    
                    VStack(spacing: 8){
                        ZStack{
                            Circle()
                                .fill(.white)
                                .frame(width: 65, height: 65)
                            
                            Image(systemName: "ellipsis")
                                .font(.title)
                        }
                        
                        Text("更多")
                            .bold()
                            .font(.system(size: 15))
                    }
                    //                    .padding()
                }
                .padding()
                
                HStack(spacing: 10){
                    Text("存款产品")
                        .font(.title2.bold())
                        .padding()
                        .padding(.trailing, 100)
                    Text("查看全部")
                        .bold()
                        .font(.title3)
                        .padding()
                        .padding(.leading, 30)
                    //                    .foregroundColor(Color(red: 188/255, green: 143/255, blue: 143/255))
                        .foregroundColor(Color(red: 139/255, green: 102/255, blue: 139/255))
                }
                
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 10){
                        
                        
                        VStack(alignment: .leading){
                            
                            HStack{
                                Image(systemName: "gift.circle")
                                    .font(.title3.bold())
                                Text("六月存款产品")
                                    .font(.title3.bold())
                            }
                            .padding(.top, 5)
                            .padding(.leading, 10)
                            
                            // Graph View....
                            LineGraphView1(data: samplePlot2, color: [Color("Gradient3")], flag: false)
                            // Max Size....
                                .frame(width: 200, height: 150)
                            
                            HStack{
                                
                                Text("年利率:")
                                    .font(.system(size: 12))
                                 
                                
                                Text("2.25%")
                                    .font(.title3.bold())
                                    .padding(.trailing, 40)
                                
                                Text("-0.30%")
                                    .font(.system(size: 12).bold())
                                    .foregroundColor(Color("Gradient3"))
                            }
                            .padding(.bottom, 5)
                            .padding(.leading, 13)
                            
                        }
                        .padding(.vertical, 1)
                        .padding(.horizontal, 5)
                        .cornerRadius(18)
                        .background(.white)
                        .cornerRadius(18)
                        
                        .padding(.trailing, 30)
                        
                        
                        
                        VStack(alignment: .leading){
                            
                            HStack{
                                Image(systemName: "gift.circle")
                                    .font(.title3.bold())
                                Text("十二月存款产品")
                                    .font(.title3.bold())
                            }
                            .padding(.top, 5)
                            .padding(.leading, 10)
                            
                            // Graph View....
                            LineGraphView2(data: samplePlot, color: [.green], flag: false)
                            // Max Size....
                                .frame(width: 200, height: 150)
                            
                            HStack{
                                
                                Text("年利率:")
                                    .font(.system(size: 12))
                                  
                                
                                Text("1.60%")
                                    .font(.title3.bold())
                                    .padding(.trailing, 30)
                                
                                Text("-0.15%")
                                    .font(.system(size: 12).bold())
                                    .foregroundColor(.green)
                            }
                            .padding(.leading, 13)
                            .padding(.bottom, 5)
                            
                        }
                        .padding(.vertical, 1)
                        .padding(.horizontal, 5)
                        .cornerRadius(18)
                        .background(.white)
                        .cornerRadius(18)
                        
                        
                    }
                }
                .padding(.leading, 20)
            }
            
        }
        .frame(height:720)
        .offset(y:-35)
        .wait(showWait: $hudState.showWait) {
            VStack(spacing: 4){
//                AnimatedImage(name: "loading")
                ProgressView()
//                    Image(systemName: "paperplane.circle")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 100, height: 100)
                
                Text(hudState.message)
                    .font(.system(size: 14, weight: .semibold))
            }
        }
        .alertMessage(isPresented: $hudState.isPresented) {
            Label(hudState.message, systemImage: hudState.systemImageName)
        }
//        .navigationBarTitle("首页", displayMode: .inline)
//        .navigationBarHidden(true)
    }
}

struct HomeView2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView2()
    }
}


let samplePlot2: [CGFloat] = [
    989,1200,750,790,650,950,1200,600,500
]
