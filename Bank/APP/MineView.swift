//
//  MyInformation.swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/17.
//

import SwiftUI

struct MineView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Person.entity(), sortDescriptors: []) var persons: FetchedResults<Person>
    
    @State private var isActive:[Bool] = Array(repeating: false, count: 10)
    
    @State private var flag = false
    
    @State var user = UserModel()
    
    @State private var action: Int? = 0
    
    var body: some View {
        //        ScrollView(.vertical){
        //            ZStack(alignment:.topLeading){
        //                Image("bg1")
        //                    .resizable()
        //                    .aspectRatio(contentMode: .fit)
        //                    .cornerRadius(8.0)
        //                Image("touxiang")
        //                    .resizable()
        //                    .scaledToFill()
        //                    .frame(width: 90, height: 90)
        //                    .clipShape(Circle())
        //                    .overlay(
        //                    Circle().stroke(Color.white, lineWidth: 5)
        //                    )
        //                    .padding(25)
        //
        //            }
        //            ZStack{
        //                Rectangle()
        //                    .fill(.white)
        //                    .frame(width: 320, height: 100)
        //                    .cornerRadius(15)
        //                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
        //                HStack{
        //                    NavigationLink(destination: MyAccountView(isActvie: $isActive[0]),isActive: $isActive[0]){
        //                        EmptyView()
        //                    }
        //                    VStack {
        //                        Image(systemName: "person")
        //                            .resizable()
        //                            .frame(width:20,height:20)
        //                            .padding(1)
        //                        Text("我的银行卡")
        //                            .bold()
        //                    }.onTapGesture{ isActive[0] = true}
        //                    //                        .navigationBarTitle("首页", displayMode: .inline)
        //                    //                    .buttonStyle(DefaultButtonStyle())
        //                    //                    .listStyle(InsetGroupedListStyle())
        //                    VStack {
        //                        Image(systemName: "arrow.left.arrow.right.circle")
        //                            .resizable()
        //                            .frame(width:20,height:20)
        //                            .padding(1)
        //                        Text("转账")
        //                            .bold()
        //                    }
        //                    .padding()
        //
        //                    VStack {
        //                        Image(systemName: "note.text")
        //                            .resizable()
        //                            .frame(width:20,height:20)
        //                            .padding(1)
        //                        Text("交易明细")
        //                            .bold()
        //                    }
        //                    .padding()
        //                }
        //            }
        //            .padding(-55)
        //
        //MARK: - 我的服务
        /*
         ZStack{
         Rectangle()
         .fill(.white)
         .frame(width: 300, height: 145)
         .cornerRadius(15)
         .shadow(color: .gray, radius: 1, x: 1, y: 1)
         VStack(alignment: .leading, spacing: 0){
         Text("我的服务")
         .font(.title2)
         .fontWeight(.heavy)
         .padding(.top,15)
         Spacer()
         HStack{
         NavigationLink(destination: ModifyPasswordView(isActive: $isActive[1]),isActive: $isActive[1]){
         EmptyView()
         }
         VStack{
         ZStack{
         //                                Circle()
         //                                    .fill(.quaternary)
         //                                    .frame(width:60,height:60)
         Image(systemName: "square.and.pencil")
         .resizable()
         .frame(width:35,height:35,alignment: .center)
         .onTapGesture {
         isActive[1] = true
         }
         }
         .padding(5)
         Text("修改密码")
         .font(.subheadline)
         }.padding(5)
         NavigationLink(destination: MyInformationView(isActive: $isActive[2]),isActive: $isActive[2]){
         EmptyView()
         }
         VStack{
         ZStack{
         //                                Circle()
         //                                    .fill(.quaternary)
         //                                    .frame(width:60,height:60)
         Image(systemName: "person.text.rectangle")
         .resizable()
         .frame(width:35,height:35,alignment: .center)
         .onTapGesture {
         isActive[2] = true
         }
         }
         Text("个人信息")
         .font(.subheadline)
         }.padding(5)
         NavigationLink(destination: LoginRecordView(isActive: $isActive[3]),isActive: $isActive[3]){
         EmptyView()
         }
         VStack{
         ZStack{
         //                                Circle()
         //                                    .fill(.quaternary)
         //                                    .frame(width:60,height:60)
         Image(systemName: "clock")
         .resizable()
         .frame(width:30,height:30,alignment: .center)
         .onTapGesture {
         isActive[3] = true
         }
         }
         Text("登陆记录")
         .font(.subheadline)
         }.padding(5)
         NavigationLink(destination: MyBagView(isActive: $isActive[4]),isActive: $isActive[4]){
         EmptyView()
         }
         VStack{
         ZStack{
         //                                Circle()
         //                                    .fill(.quaternary)
         //                                    .frame(width:60,height:60)
         Image(systemName: "bag")
         .resizable()
         .frame(width:30,height:30,alignment: .center)
         .onTapGesture {
         isActive[4] = true
         }
         }
         Text("我的钱包")
         .font(.subheadline)
         }.padding(5)
         }
         }
         .frame(width: 300, height: 145)
         }.padding(.top,70)
         */
        //MARK: - List列表视图方法
        
        VStack{
            
            ZStack(alignment:.topLeading){
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8.0)
                    .opacity(0.1)
                HStack{
                    Image("touxiang")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 5)
                        )
                    VStack{
                        
                        if !isEmptyPersons(){
                            Text("暂未登陆")
                                .font(.title2)
                                .padding()
                        }else{
                            
                            
                            Text(selectPerson().realName != nil ? selectPerson().realName! : "暂未登陆")
                                .font(.title2)
                                .padding()
                        }
                    }
                }
                    .padding(25)
                    .onAppear{
                        if !isEmptyPersons(){
                            user.userId = nil
                            user.realName = nil
                        }
                        else {
                            
                            BankApi.shared.selectBankUserDetailsByUserId(userId: Int(selectPerson().userId)).subscribe(onNext: { Responce in
                               user.userId = Responce.data.userId
                                                            user.email = Responce.data.email
                                                            user.documentType = Responce.data.documentType
                                                            user.sex = Responce.data.sex
                                                            user.nativePlace = Responce.data.nativePlace
                                                            user.realName = Responce.data.realName
                                
                                                            addPersonName(name: user.realName)
                                
                                
                            }, onError: nil, onCompleted: nil, onDisposed: nil)
                        }
                    }
                    .padding(25)
            }
            List{
                NavigationLink(destination: MyBankcardView(isActive: $isActive[0]),isActive: $isActive[0]){
                    Image(systemName: "creditcard")
                        .foregroundColor(.pink)
                    Text("我的银行卡")
                }
                .onTapGesture{
                    isActive[0] = true
                }
                .padding()
                NavigationLink(destination: ModifyPasswordView(isActive: $isActive[1]),isActive: $isActive[1]){
                    Image(systemName: "square.and.pencil")
                        .foregroundColor(.green)
                    Text("修改密码")
                }.onTapGesture{
                    isActive[1] = true
                }
                .padding()
                NavigationLink(destination: MyInformationView(isActive: $isActive[2]).environmentObject(user),isActive: $isActive[2]){
                    Image(systemName: "person.text.rectangle")
                        .foregroundColor(.blue)
                    Text("个人信息")
                }.onTapGesture{
                    isActive[2] = true
                }
                .padding()
                NavigationLink(destination: LoginRecordView(isActive: $isActive[3]),isActive: $isActive[3]){
                    Image(systemName: "clock")
                        .foregroundColor(.orange)
                    Text("登陆记录")
                }.onTapGesture{
                    isActive[3] = true
                }
                .padding()
                NavigationLink(destination: LoginRecordView(isActive: $isActive[4]),isActive: $isActive[4]){
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(.red)
                    Text("帮助")
                }.onTapGesture{
                    isActive[4] = true
                }
                .padding()
                NavigationLink(destination: LoginRecordView(isActive: $isActive[5]),isActive: $isActive[5]){
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(.purple)
                    Text("版本号")
                }.onTapGesture{
                    isActive[5] = true
                }
                .padding()
                
                NavigationLink(destination: LoginView(), isActive: $isActive[6]){
                    Image(systemName: "arrow.left.square")
                        .foregroundColor(.brown)
                    Text("退出登陆")
//                        .alert(isPresented: $flag) {
//                            Alert(title: Text("退出账号"),
//                                  message: Text("确定退出当前账号"),
//                                  dismissButton: .default(Text("确定"))
//                                  
//                            )
//                            
//                        }
                        .onTapGesture{
//                            self.flag = true
//                            isActive[5] = false
                            showHUD(image: "arrow.left.square", title:"退出登陆")
                            deletePersons(offsets: [0])
                            //                    print("222")
                            //
                        }
                }
                
                                        
               
//                .onSubmit({
//                    self.flag = true
//                })
                   
                    
                  //  isActive[6] = true
                
                .padding()
            }
            
            .listStyle(.inset)
            
            .padding(.top,-60)
//            .background(
//                Color("Color")
//            )
//            
//
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(
//            Color("Color")
//        )
//        .navigationBarBackButtonHidden(true)
        //        .navigationBarTitle("个人中心", displayMode: .inline)
        
        //        }
    }
    
    func deletePersons(offsets: IndexSet){
//        offsets.forEach { index in
//            let p = self.persons[index]
//
            viewContext.delete(persons[0])
//        }
        saveContext()
    }
    
    func addPersonName(name: String){
        persons[0].realName = name
        saveContext()
    }
    
    
    func isEmptyPersons() -> Bool{
        if persons.isEmpty {
            return false
        }
        return true
    }
    
    func selectPerson() -> Person{
        return persons[0]
    }
    
    func saveContext() {
          do {
            try viewContext.save()
          } catch {
            print("Error saving managed object context: \(error)")
          }
        }
    
}
struct MineView_Previews: PreviewProvider {
    static var previews: some View {

            MineView()
        
    }
}

extension View{
    func getRootController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        guard let root = screen.windows.last? .rootViewController else{
            return .init()
        }
        
        return root
    }
    
    func getRect1() -> CGRect{
        return UIScreen.main.bounds
    }
    
    func showHUD(image: String, color: Color = .primary, title: String){
        let hudViewController = UIHostingController(rootView: HUDView(image: image, color: color, title: title))
        let size = hudViewController.view.intrinsicContentSize
        
        hudViewController.view.frame.size = size
        
        hudViewController.view.frame.origin = CGPoint(x: (getRect1().width / 2 - (size.width / 2)), y: 50)
        
        hudViewController.view.backgroundColor = .clear
        getRootController().view.addSubview(hudViewController.view)
        
    }
}

struct HUDView: View{
    var image: String
    var color: Color
    var title: String
    
    @Environment (\.colorScheme) var scheme
    
    @State var showHUD: Bool = false
    
    var body: some View{
        HStack(spacing: 10){
            Image(systemName: image)
                .font(.title3)
                .foregroundColor(color)
            Text(title)
                .foregroundColor(color)
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(
            scheme == .dark ? Color.black : Color.white
        )
        .clipShape(Capsule())
        .shadow(color: Color.primary.opacity(0.1), radius: 5, x: 1, y: 5)
        .shadow(color: Color.primary.opacity(0.03), radius: 5, x: 0, y: -5)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .offset(y: showHUD ? 0 : -200)
        .onAppear{
            withAnimation(.easeInOut(duration: 0.5)){
                showHUD = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.easeInOut(duration: 0.5)){
                    showHUD = false
                }
            }
        }
    }
}
