//
//  LineGraphView.swift
//  Bank
//
//  Created by 许丰炼 on 2022/3/28.
//

import SwiftUI

//Custom View....
struct LineGraphView1: View {
    
    //Number of plots...
    
    var data: [CGFloat]
    
    var color: [Color]
    
    var flag: Bool
    
    @State var currentPlot = ""
    
    // Offset...
    
    @State var offset: CGSize = .zero
    
    @State var showPlot = false
    
    @State var translation : CGFloat = 0
    
    var body: some View {
        
        GeometryReader{proxy in
            
            let height = proxy.size.height
            let width = (proxy.size.width) / CGFloat(data.count - 1 )
            let maxPoint = (data.max() ?? 0) + 100
            let points = data.enumerated().compactMap{ item -> CGPoint in
                
                //getting progress and multiplyin with height
                let progress = item.element / maxPoint
                
                let pathHeight = progress * height
                
                // width...
                let pathWidth = width * CGFloat(item.offset)
                
                // Since we need peak to top not bottom...
                
                return CGPoint(x:pathWidth, y: -pathHeight + height)
            }
            
            let points1 = samplePlot1.enumerated().compactMap{ item -> CGPoint in
                
                //getting progress and multiplyin with height
                let progress = item.element / maxPoint
                
                let pathHeight = progress * height
                
                // width...
                let pathWidth = width * CGFloat(item.offset)
                
                // Since we need peak to top not bottom...
                
                return CGPoint(x:pathWidth, y: -pathHeight + height)
            }
            
            ZStack{
                // Converting plot as points....
                
                // Path....
                Path{path in
                    
                    // drawing the points...
                    path.move(to: CGPoint(x: 0, y: 0))
                    
                    if flag{

                        path.addLines(points)
                    } else{
                 
                        path.addQuadCurve(to: CGPoint(x: 50, y: 100), control: CGPoint(x: 25, y: 80))
                        path.addQuadCurve(to: CGPoint(x: 100, y: 100), control: CGPoint(x: 50, y: 60))
                    path.addQuadCurve(to: CGPoint(x: 450, y: 100), control: CGPoint(x: 70, y: 5))
                    }
                    
                }
                .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                .fill(
//                   Gradient...
                    LinearGradient(colors: color,startPoint: .leading, endPoint: .trailing)

                )
                if !flag{
                    
                    Path{path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        
                        path.addLines(points1)
                    }
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .fill(
                        //                   Gradient...
                        LinearGradient(colors: color,startPoint: .leading, endPoint: .trailing)
                        
                    )
                }
                
                // Path Background Coloring...
                FillBG()
                //Clipping the shape...
                    .clipShape(
                        Path{path in
                            
                            // drawing the points...
                            path.move(to: CGPoint(x: 0, y: 0))
                            
                            path.addLines(points)
                            
                            path.addLine(to: CGPoint(x: proxy.size.width, y: height))
                            path.addLine(to: CGPoint(x: 0, y: height))
                        })
                
            }
            //MARK: - 触摸手势
//            .overlay(
//
//                //Drag Indiccator...
//                VStack(spacing: 0){
//                    Text(currentPlot)
//                        .font(.caption.bold())
//                        .foregroundColor(.white)
//                        .padding(.vertical,6)
//                        .padding(.horizontal,10)
//                        .background(Color("Gradient1"),in:Capsule())
//                        .offset(x: translation < 10 ? 30 : 0)
//                        .offset(x: translation > (proxy.size.width - 60) ? -30 : 0)
//                    Rectangle()
//                        .fill(Color("Gradient1"))
//                        .frame(width:1,height:40)
//                        .padding(.top)
//                    Circle()
//                        .fill(Color("Gradient1"))
//                        .frame(width:22,height:22)
//                        .overlay(
//                            Circle()
//                                .fill(.white)
//                                .frame(width:10,height:10)
//                        )
//                    Rectangle()
//                        .fill(Color("Gradient1"))
//                        .frame(width:1,height:55)
//
//                }
//                // Fixed Frame..
//                // For Gesture Calculation...
//                    .frame(width:80, height: 170)
//                // 170 / 2 = 85 - 15 => circle ring size...
//                    .offset(y: 70)
//                    .offset(offset)
//                    .opacity(showPlot ? 1 : 0),
//                alignment: .bottomLeading
//            )
//            .contentShape(Rectangle())
//            .gesture(DragGesture().onChanged({ value in
//                withAnimation{showPlot = true}
//                let translation = value.location.x - 40
//                // Getting index...
//                let index = max(min(Int((translation / width).rounded() + 1), data.count - 1),0)
//                currentPlot = "$ \(data[index])"
//                self.translation = translation
//                // removing half width...
//                offset = CGSize(width:points[index].x - 40, height: points[index].y - height)
//            }).onEnded({ value in
//                withAnimation{showPlot = false}
//
//            }))
        }
        .overlay(
            VStack(alignment: .leading){
                let max = data.max() ?? 0
                Text(flag ? "¥ \(Int(max))" : "")
                    .font(.caption.bold())
                Spacer()
                Text(flag ? "¥ 0" : "")
                    .font(.caption.bold())
            }
                .frame(maxWidth: .infinity,alignment: .leading)
        )
        .padding(.horizontal,5)
    }
    
    @ViewBuilder
    func FillBG()->some View{
        if flag{
            
            LinearGradient(colors:[
                Color("Gradient2")
                    .opacity(0.3),
                Color("Gradient2")
                    .opacity(0.2),
                Color("Gradient2")
                    .opacity(0.1),]
                           + Array(repeating: Color("Gradient1").opacity(0.1), count: 4)
                           + Array(repeating: Color.clear, count: 2)
                           ,startPoint: .top, endPoint: .bottom)
        }
    }
    
}

struct LineGraphView1_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}


let samplePlot3: [CGFloat] = [
    800,800,800,800,800,800,800,800,800,800,800,800,800,800,800,800,800
]
