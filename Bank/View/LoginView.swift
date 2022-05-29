//
//  LoginView.swift
//  Bank
//
//  Created by FFF on 2022/3/13.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    //coredate
    @FetchRequest(
        entity: Person.entity(), sortDescriptors: []
    ) var persons: FetchedResults<Person>
    
    @State var phone = ""
    @State var password = ""
    @Namespace var animation
    
    @State var show1 = false
    @State var show2 = false
    
    @State var flag = false
    @State var msg = ""
    
    @State private var action: Int? = 0
    @State private var action1: Int? = 0
    
    var body: some View {
        VStack{
            
            Spacer(minLength: 0)
            
            HStack{
                VStack(alignment: .leading, spacing: 10) {
                    Text("登陆")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.primary)
                    
                    Text("请登录以继续")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.leading)
            
            CustomTextField(image: "phone", title: "请输入手机号码", value: $phone, animation: animation)
            
            CustomTextField(image: "lock", title: "请输入密码", value: $password, animation: animation)
                .padding(.top, 5)
            
            HStack{
                
                Spacer(minLength: 0)
                
                VStack(alignment: .trailing, spacing: 20) {
                    Button(action: {
                        print(111)
                    }) {
                        Text("忘记密码")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.orange)
                    }
                    
                    NavigationLink(destination: ContentView(), tag:1 ,selection: $action){
                        EmptyView()
                    }
                    Button (action: {
                        BankApi.shared.login(dict: ["phone": $phone.wrappedValue, "password": $password.wrappedValue]).subscribe(onNext: { Responce in
                            msg = Responce.msg
                            if(Responce.code != "200"){
                                flag = true
                                self.action = 0
                            }
                            else{
                                addPerson(phone: $phone.wrappedValue, password: $password.wrappedValue, userId: Responce.data)
                                self.action = 1
                            }
                            
                        }, onError: nil, onCompleted: nil, onDisposed: nil)
//                        action = 1
//                        showHUD(image: "figure.wave", title:"登陆成功")
                    })
                    {
                    
//                        NavigationLink(destination: ContentView(), isActive: $show2){
                            
                            HStack(spacing: 10) {
                                Text("登陆")
                                    .fontWeight(.heavy)
                                
                                Image(systemName: "arrow.right")
                                    .font(.title2)
                            }
                            .modifier(CustomButtonModifier())
                            
//                        }
                        
                    }
                    .alert(isPresented: $flag) {
                        Alert(title: Text(""),
                              message: Text(msg),
                              dismissButton: .default(Text("OK")))
                    }
                    
                }
            }
            .padding()
            .padding(.top, 10)
            .padding(.trailing)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 8){
                Text("你没有账户吗？")
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                
                NavigationLink(destination: RegisterView(), tag:1 ,selection: $action1){
                    EmptyView()
                }
                
                Button {
//                        show1.toggle()
//                        print(show1)
                    action1 = 1
                  
                } label: {
//                    NavigationLink(destination: RegisterView(show: $show1), isActive: $show1){
                        Text("注册")
                            .fontWeight(.heavy)
                            .foregroundColor(Color.orange)
//                    }
                    
                }
            }
            .padding()
            
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("Color")
        )
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
    
    
    
    func addPerson(phone: String, password: String, userId: Int){
        let p = Person(context: viewContext)
        p.id = UUID()
        p.phone = phone
        p.password = password
        p.userId = Int16(userId)
        
        try? viewContext.save()
    }
    
    func deletePersons(offsets: IndexSet){
        offsets.forEach{ index in
            let stu = self.persons[index]
            
            viewContext.delete(stu)
        }
        
        saveContext()
    }
    
    func selectPerson(index: Int){
        let stu = self.persons[index]
    }
    
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
}

