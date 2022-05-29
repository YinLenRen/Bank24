//
//  BankApp.swift
//  Bank
//
//  Created by FFF on 2022/1/17.
//

import SwiftUI

@main
struct BankApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            EnterView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            HomeView2()
//            AnalyticsView()
//            TestView3()
//            WalletView(wallet: Wallet.init(cards: cards), action: .constant(1))
        }
    }
}
