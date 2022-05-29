//
//  LoginRecordView.swift
//  Bank
//
//  Created by 许丰炼 on 2022/1/19.
//

import SwiftUI

struct LoginRecordView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Person.entity(), sortDescriptors: []) var persons: FetchedResults<Person>
    
    
    @Binding var isActive:Bool
    
    var body: some View {
        Text("")
            .alert(isPresented: .constant(true)) {
                Alert(title: Text("退出账号"),
                      message: Text("确定退出当前账号"),
                              dismissButton: .default(Text("确定")))
                    }
    }
    
    func deletePersons(offsets: IndexSet){
        persons.forEach { item in
            viewContext.delete(item)
        }
    }
}

struct LoginRecordView_Previews: PreviewProvider {
    static var previews: some View {
        LoginRecordView(isActive: .constant(true))
    }
}
