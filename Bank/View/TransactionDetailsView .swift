//
//  TransactionDetailsView .swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/24.
//

import SwiftUI
import CoreData

/* Picker版
 struct TransactionDetailsView: View {
 @State private var currentTab = 0
 @Binding var isActive:Bool
 var body: some View {
 VStack(alignment:.leading){
 HStack(){
 Text("活期储蓄")
 .font(.largeTitle)
 Spacer()
 }.padding()
 Picker(selection: $currentTab, label: Text("Picker"),content: {
 Text("当天").tag(0)
 Text("一个月").tag(1)
 Text("两个月").tag(2)
 Text("全部").tag(3)
 }).pickerStyle(SegmentedPickerStyle())
 if currentTab == 0{
 page1()
 Spacer()
 }
 else if currentTab == 1{
 page2()
 Spacer()
 }
 else if currentTab == 2{
 page3()
 Spacer()
 }
 else{
 page4()
 Spacer()
 }
 }.animation(.spring(), value: self.currentTab)
 .navigationTitle("交易明细")
 }
 }
 struct page1:View{
 @State private var currentTab = 0
 var body: some View{
 Picker(selection: $currentTab, label: Text("Picker"),content: {
 Text("总收入").tag(0)
 Text("总支出").tag(1)
 }).pickerStyle(SegmentedPickerStyle())
 }
 }
 struct page2:View{
 @State private var currentTab = 0
 var body: some View{
 Picker(selection: $currentTab, label: Text("Picker"),content: {
 Text("总收入").tag(0)
 Text("总支出").tag(1)
 }).pickerStyle(SegmentedPickerStyle())
 }
 }
 struct page3:View{
 @State private var currentTab = 0
 var body: some View{
 Picker(selection: $currentTab, label: Text("Picker"),content: {
 Text("总收入").tag(0)
 Text("总支出").tag(1)
 }).pickerStyle(SegmentedPickerStyle())
 }
 }
 struct page4:View{
 @State private var currentTab = 0
 var body: some View{
 Picker(selection: $currentTab, label: Text("Picker"),content: {
 Text("总收入").tag(0)
 Text("总支出").tag(1)
 }).pickerStyle(SegmentedPickerStyle())
 }
 }
 */


// TopView版
private let TITLES = ["当天", "近一个月", "近两个月", "全部"]
private let TITLE_SPACING = 10.0
private let pwidth: CGFloat  = UIScreen.main.bounds.size.width




struct TransactionDetailsView: View {
    @State private var selectedIndex = 0
    @Binding var isActive:Bool
    //    @State  var transactions : TransactionDetailModel
    
    @Environment(\.managedObjectContext) private var viewContext

    //coredate
    @FetchRequest(
        entity: Person.entity(), sortDescriptors: []
    ) var persons: FetchedResults<Person>
    
    @State private var transactions: [TransactionDetailModel] = []
    
    var body: some View {
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
//                ForEach(0 ..< TITLES.count) {index in
//                                       Text(TITLES[selectedIndex])
                    List{
                        ForEach(transactions){ item in
                            VStack{
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(item.productName ?? "")
                                            .padding(.top,10)
                                        Text(item.valueTime.prefix(10) ?? "")
                                    }
                                    Spacer()
                                    HStack{
                                        Text(item.payMoney ?? "")
                                        Text("元")
                                    }.foregroundColor(Color.red)
                                }.padding()
                            }
                        }
                        
                    }.listStyle(InsetListStyle())
                   
//                }
            }
            .onAppear{
                var dict = [String: Any]()
                dict["userId"] = selectPerson(index: 0).userId
                dict["index"] = 0
                BankApi.shared.selectBankDepositOrderByIndex(dict: dict).subscribe(onNext: { Responce in
                    transactions = Responce.data
                }, onError: nil, onCompleted: nil, onDisposed: nil)
            }
            .onChange(of: selectedIndex) { index in
                var dict = [String: Any]()
                dict["userId"] = selectPerson(index: 0).userId
                dict["index"] = selectedIndex
                BankApi.shared.selectBankDepositOrderByIndex(dict: dict).subscribe(onNext: { Responce in
                    transactions = Responce.data
                }, onError: nil, onCompleted: nil, onDisposed: nil)
            }
            //           .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
//        .navigationTitle("交易明细")
        .navigationBarTitle("交易明细", displayMode: .inline)
    }
    
    func selectPerson(index: Int) -> Person{
        return persons[index]
    }
}

//struct TransactionDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TransactionDetailsView(isActive: .constant(true))
//    }
//}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
