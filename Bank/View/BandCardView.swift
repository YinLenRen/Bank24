//
//  BandCardView.swift
//  Bank
//
//  Created by FFF on 2022/3/12.
//

import SwiftUI


struct BandCardView: View {
    
    @EnvironmentObject var bankCard: BankCard
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.white)
                .frame(width: 250, height: 100)
                .cornerRadius(15)
                .shadow(color: .gray, radius: 2, x: 1, y: 1)
            //                .padding(.top,-140)
            VStack(alignment:.leading){
                HStack{
                    Text("卡号:")
                    Text(bankCard.bankCardid ?? "62586898753")
                }.padding()
                HStack{
                    Text("可存入:")
                    Text(bankCard.remain ?? "1000")
                }.padding()
               
            }
        }                        .padding(.top,-140)
    }
}


