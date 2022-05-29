//
//  AnalyticsView.swift
//  Bank
//
//  Created by 许丰炼 on 2022/3/28.
//

import SwiftUI

struct AnalyticsView: View {
    var body: some View {
        ScrollView(.vertical){
        VStack{
//
//            HStack{
//
//                Button{
//
//                } label:{
//                    Image(systemName: "slider.vertical.3")
//                        .font(.title2)
//                }
//                Spacer()
//
//                Button{
//
//                } label: {
//                    Image("bg1")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 45, height: 45)
//                        .clipShape(Circle())
//                }
//            }
//            .padding()
//            .foregroundColor(.black)
            
            VStack(spacing:10){
                Text("余额")
                    .fontWeight(.bold)
                Text("¥ 74,821.00")
                    .font(.system(size:38,weight: .bold))
            }
            .padding(.top,20)
            
            Button{
                
            } label: {
                HStack(spacing:5){
                    
                    Text("余额变化")
                    
                    Image(systemName: "chevron.down")
                    
                }
                .font(.caption.bold())
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .background(.white,in:Capsule())
                .foregroundColor(.black)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.03), radius: 5, x: -5, y: -5)
            }
            
            // Graph View....
            LineGraphView(data: samplePlot, color: [Color("Gradient1"),  Color("Gradient2")], flag: true)
            // Max Size....
                .frame(height: 250)
                .padding(.top, 25)
            Text("存款产品")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    CardView(image: "gift.circle", title: "6月存款产品", price: "1.85%", color: Color("Gradient1"))
                    CardView(image: "gift.circle", title: "9月存款产品", price: "2.05%", color: Color("Gradient2"))
                    CardView(image: "gift.circle", title: "12月存款产品", price: "2.25%", color: Color.green)
                }
            }
            
        }
//        .background(
//            Color("Color")
//        )
//        .background(.white)
    }
        .frame(height:700)
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
    }
    // Card View..
    @ViewBuilder
    
    func CardView(image: String, title: String, price: String, color:Color)->some View{
        VStack(spacing:15){
            Image(systemName: image)
                .resizable()
//                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.white)
                .frame(width: 35, height: 35)
                .padding()
                .background(color,in: Circle())
            Text(title)
                .font(.title3.bold())
            Text(price)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        .background(.white,in: RoundedRectangle(cornerRadius: 15))
        //shadows
        .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.03), radius: 5, x: -5, y: -5)
    }
    
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}

// Sample Plot For Graph....

let samplePlot: [CGFloat] = [
    989,1200,750,790,650,950,1200,600,500,600,890,1203,1400,900,1250,1600,1200
]
//let samplePlot: [CGFloat] = [
//    700,750,750,790,800,850,900,950,1000,1500,2000,1200,1300,1200,1250,1100,1000
//]
