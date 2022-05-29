//
//  TestView3.swift
//  Bank
//
//  Created by 许丰炼 on 2022/3/31.
//

import SwiftUI
import SDWebImageSwiftUI

struct TestView3: View {
    
    @StateObject var hudState: BenHUDState = BenHUDState()
    
    var body: some View {
        ZStack(alignment: .top){
            NavigationView{
                Button{
                    withAnimation {
                        hudState.showWait(message: "正在请求，请稍等")
                        
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                            hudState.showWait = false
//                            hudState.alertMessage(message: "更新成功", systemImageName: "tray.and.arrow.down")
//                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            hudState.showWait = false
                            hudState.alertMessage(message: "更新失败", systemImageName: "icloud.slash")
                        }
                    }
                }label: {
                    Text("show hud")
                }
            }
            .wait(showWait: $hudState.showWait) {
                VStack(spacing: 4){
                    AnimatedImage(name: "loading.gif")
//                    Image(systemName: "paperplane.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                    
                    Text(hudState.message)
                        .font(.system(size: 14, weight: .semibold))
                }
            }
            .alertMessage(isPresented: $hudState.isPresented) {
                Label(hudState.message, systemImage: hudState.systemImageName)
            }

        }
    }
}

struct TestView3_Previews: PreviewProvider {
    static var previews: some View {
        TestView3()
    }
}

extension View{
    func wait<Content: View>(showWait: Binding<Bool>, @ViewBuilder content: () -> Content) -> some View{
        ZStack{
            self
            
            if showWait.wrappedValue{
                BenHUD(type: .wait, content: content)
                    .zIndex(1)
            }
        }
    }
    
    func alertMessage<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content)  -> some View {
        ZStack(alignment: .top){
            self
            if isPresented.wrappedValue{
                BenHUD(type: .alert, content: content)
                    .transition(AnyTransition.move(edge:.top).combined(with: .opacity))
                    
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                
                                isPresented.wrappedValue = false
                            }
                        }
                    })
                    .zIndex(1)
            }
        }
    }
}
