//
//  BenHUDState.swift
//  Bank
//
//  Created by 许丰炼 on 2022/3/31.
//

import Foundation
import SwiftUI


final class BenHUDState: ObservableObject{
    @Published var showWait: Bool = false
    
    @Published var isPresented: Bool = false
    
    private(set) var message: String = ""
    
    private(set) var systemImageName: String = ""
    
    func showWait(message: String){
        self.message = message
        
        withAnimation {
            showWait = true
        }
    }
    
    func alertMessage(message: String, systemImageName: String){
        self.message = message
        self.systemImageName = systemImageName
        
        withAnimation {
            isPresented = true
        }
    }
}
