//
//  RegisterVIew.swift
//  Bank
//
//  Created by FFF on 2022/3/13.
//

import SwiftUI

struct RegisterView: View {
    
    
    @State var email = ""
    @State var password = ""
    @State var number = ""
    @State var name = ""
    @State var idCard = ""
    
//    @Binding var show: Bool
    
    @State private var action: Int? = 0
    @State private var action1: Int? = 0
    
    @Namespace var animation
    
    @State var flag = false
    @State var msg = ""
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                HStack{
                    NavigationLink(destination: LoginView(), tag:1 ,selection: $action1){
                        EmptyView()
                    }
                    
                    Button{
//                        show.toggle()
//                        print(show)
                        action = 1
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        
                    }
                    
                    Spacer()
                }
                .padding()
                .padding(.leading)
                
                HStack{
                    Text("注册账户")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    
                    Spacer()
                }
                .padding()
                .padding(.leading)
                
                CustomTextField(image: "person", title: "请输入姓名", value: $name, animation: animation)
                
                CustomTextField(image: "envelope", title: "请输入电子邮箱", value: $email, animation: animation)
                    .padding(.top, 5)
                
                CustomTextField(image: "lock", title: "请输入密码", value: $password, animation: animation)
                    .padding(.top, 5)
                
                CustomTextField(image: "phone", title: "请输入手机号码", value: $number, animation: animation)
                    .padding(.top, 5)
                
                CustomTextField(image: "creditcard", title: "请输入身份证", value: $idCard, animation: animation)
                    .padding(.top, 5)
                
                
                HStack{
                    
                    Spacer()
                    
                    NavigationLink(destination: LoginView(), tag:1 ,selection: $action){
                        EmptyView()
                    }
                    
                    Button(action: {
                        var dict = [String: Any]()
                        dict["realName"] = $name.wrappedValue
                        dict["documentCode"] = $idCard.wrappedValue
//                        BankApi.shared.register(dict: dict).subscribe(onNext: { Responce in
//                            msg = Responce.msg
//                            if(Responce.code != "200"){
//                                flag = true
//                                self.action = 0
//                                print(111)
//                            }
//                            else{
//                                self.action = 1
//                                print(222)
//                            }
//                        }, onError: nil, onCompleted: nil, onDisposed: nil)
                        showHUD(image: "cross", title:"注册成功")
                        
                    }) {
                        HStack(spacing: 10) {
                            
                            Text("注册")
                                .fontWeight(.heavy)
                            Image(systemName: "arrow.right")
                                .font(.title2)
                        }
                        .modifier(CustomButtonModifier())
                        //                    }
                        
                    }
                    .alert(isPresented: $flag) {
                        Alert(title: Text(""),
                              message: Text(msg),
                              dismissButton: .default(Text("OK")))
                    }
                }
                .padding()
                .padding(.top)
                .padding(.trailing)
                
                HStack(spacing: 8){
                    Text("你是否已有账户？")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: LoginView(), tag:1 ,selection: $action1){
                        EmptyView()
                    }
                    
                    Button(action: {action1 = 1}) {
                        Text("登陆")
                            .fontWeight(.heavy)
                            .foregroundColor(.orange)
                    }
                }
                .padding()
                .padding(.top, 70)
                
                //            Spacer(minLength: 0)
                
            }
            
        }
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("Color")
        )
        
//        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    
}
