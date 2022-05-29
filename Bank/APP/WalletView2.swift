//
//  Home.swift
//  test
//
//  Created by 许丰炼 on 2022/3/28.
//

import SwiftUI

struct WalletView2: View {
    
    //MARK:  Animation Properties
    
    @State var expandCards: Bool = false
    
    //MARK: Detail View Properties
    @State var currentCard: HomeCard?
    @State var showDetailCard: Bool = false
    @Namespace var animation
    
    var body: some View {
        ScrollView{
        VStack(spacing: 0){
            
            Text("钱包")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: expandCards ? .leading : .center)
                .overlay(alignment: .trailing){
                    // MARK: - Close Button
                    
                    Button{
                        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)){
                            expandCards = false
                        }
                    } label:{
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue, in: Circle())
                    }
                    .rotationEffect(.init(degrees: expandCards ? 45 : 0))
                    .offset(x: expandCards ? 10 : 15)
                    .opacity(expandCards ? 1 : 0)
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing:0){
                    // MARK: - HomeCards
                    ForEach(homeCards){homeCard in
                        Group{
                            //MARK: - 纯过渡就删除if...else
                            if currentCard?.id == homeCard.id && showDetailCard{
                                HomeCardView(homeCard: homeCard).opacity(0)
                            }
                            else{
                                HomeCardView(homeCard: homeCard)
                                    .matchedGeometryEffect(id: homeCard.id, in: animation)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)){
                                currentCard = homeCard
                                showDetailCard = true
                            }
                        }
                    }
                }
                .overlay{
                    // To Avoid Scrolling
                    Rectangle()
                        .fill(.black.opacity(expandCards ? 0 : 0.01))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)){
                                expandCards = true
                            }
                        }
                }
                .padding(.top, expandCards ? 30 : 0)
            }
            .coordinateSpace(name: "SCROLL")
            .offset(y: expandCards ? 0 :30)
            
            //MARK: - Add Button
            Button{
                withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)){
                    expandCards = false
                }
            } label:{
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.blue, in: Circle())
            }
            .rotationEffect(.init(degrees: expandCards ? 180 : 0))
            .scaleEffect(expandCards ? 0.01 : 1)
            .opacity(!expandCards ? 1 : 0)
            .frame(height: expandCards ? 0 : nil)
            .padding(.bottom, expandCards ? 0 : 60)
            
        }
        .padding([.horizontal,.top])
        .frame(height:750)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//        .background(
//            Color("Color")
//        )
        .overlay{
            if let currentCard = currentCard,showDetailCard {
                DetailView(currentCard: currentCard, showDetailCard: $showDetailCard, animation: animation)
            }
        }
        }
    }

    //MARK: - HomeCard View
    @ViewBuilder
    func HomeCardView(homeCard: HomeCard)->some View{
        GeometryReader{proxy in
            
            let rect = proxy.frame(in: .named("SCROLL"))
            
            let offset = CGFloat(getIndex(HomeCard: homeCard) * (expandCards ? 10 : 70))
            
            ZStack(alignment: .bottomLeading){
                Image(homeCard.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                // Card Details
                
                VStack(alignment: .leading, spacing: 10){
                    Text(homeCard.name)
                        .fontWeight(.bold)
                    
                    Text(customisedCardNumber(number:homeCard.cardNumber))
                        .font(.callout)
                        .fontWeight(.bold)
                    
                }
                .padding()
                .padding(.bottom,10)
                .foregroundColor(.white)
            }
            
            .offset(y: expandCards ? offset : -rect.minY + offset)
            
        }
        // Max size
        .frame(height: 200)
    }
    
    func getIndex(HomeCard: HomeCard)->Int{
        return homeCards.firstIndex { currentCard in
            return currentCard.id == HomeCard.id
        } ?? 0
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        WalletView2()
    }
}
// MARK: - 只显示最后四位卡号
func customisedCardNumber(number: String)->String{
    var newValue: String = ""
    let maxCount = number.count - 4
    number.enumerated().forEach { value in
        if value.offset >= maxCount {
            // Displaying Text
            let string = String(value.element)
            newValue.append(contentsOf: string)
        }
        else{
            // Simply Displaying Star
            // Avoiding Space
            let string = String(value.element)
            if string == " "{
                newValue.append(contentsOf: " ")
                
            }
            else{
                newValue.append(contentsOf: "*")
            }
        }
    }
    return newValue
}

//MARK: - Detail View

struct DetailView: View {
    var currentCard: HomeCard
    @Binding var showDetailCard: Bool
    
    var animation: Namespace.ID
    
    //Delaying Expenses View
    
    @State var showExpenseView: Bool = false
    
    var body: some View{
        
        VStack{
            HomeCardView()
                .matchedGeometryEffect(id: currentCard.id, in: animation)
                .frame(height: 200)
                .onTapGesture {
                    withAnimation(.easeInOut){
                        showExpenseView = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                        withAnimation(.easeInOut(duration: 0.35)){
                            showDetailCard = false
                        }
                    }
                }
                .zIndex(10)
            GeometryReader{proxy in
                let height = proxy.size.height + 50
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 20){
//                         Expenses
                        ForEach(expenses){
                            expense in
                            ExpenseCardView(expense: expense)
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .background(
                    Color.white.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .ignoresSafeArea()
                )
                .offset(y: showExpenseView ? 0 : height)
            }
            .padding([.horizontal,.top])
            .zIndex(-10)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("BG").ignoresSafeArea())
        //        .ignoresSafeArea()
        .onAppear{
            withAnimation(.easeInOut.delay(0.1)){
                showExpenseView = true
            }
        }
    }
    
    @ViewBuilder
    func HomeCardView()->some View{
        ZStack(alignment: .bottomLeading){
            Image(currentCard.cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
            // Card Details
            
            VStack(alignment: .leading, spacing: 10){
                Text(currentCard.name)
                    .fontWeight(.bold)
                
                Text(customisedCardNumber(number:currentCard.cardNumber))
                    .font(.callout)
                    .fontWeight(.bold)
                
            }
            .padding()
            .padding(.bottom,10)
            .foregroundColor(.white)
        }
    }
}

struct ExpenseCardView: View{
    var expense: Expense
    @State var showView: Bool = false
    var body: some View{
        HStack(spacing: 14){
            Image (systemName: expense.productIcon)
                .resizable()
                .aspectRatio (contentMode: .fit)
                .frame (width: 45, height: 45)

            VStack(alignment: .leading, spacing: 8) {
                Text (expense.product)
                    .fontWeight(.bold)
                Text (expense.spendType )
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            VStack(spacing: 8){
                Text(expense.amountSpent)
                    .fontWeight(.bold)
                Text(Date().formatted(date:.numeric, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .opacity(showView ? 1 : 0)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                withAnimation(.easeInOut(duration: 0.3).delay(Double(getIndex()) * 0.1)){
                    showView = true
                }
            }
        }
    }
    func getIndex()->Int{
        return expenses.firstIndex { currentExpense in
            return expense.id == currentExpense.id
        } ?? 0
    }
}

