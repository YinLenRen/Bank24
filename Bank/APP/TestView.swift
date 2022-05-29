//
//  TestView.swift
//  Bank
//
//  Created by FFF on 2022/3/4.
//

import SwiftUI
import CoreData

struct TestView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Person.entity(), sortDescriptors: []
    ) var persons: FetchedResults<Person>
    
    var body: some View {
        VStack {
            List {
                ForEach(persons, id: \.id) { student in
                    Text(student.phone ?? "Unknown")
                    Text(student.password ?? "Unknown")
                    Text(String(student.userId) ?? "Unknown")
                    Text(student.realName ?? "Unknown")
                }
            }
            
            Button("Add") {
                let phones = ["15867978453", "15669821130", "18268381878", "19817801882"]
                let passwords = ["233", "12345", "2222", "Weasley"]

                let phone = phones.randomElement()!
                let password = passwords.randomElement()!

                // more code to come
//                addStu(phone: phone, password: password)
                deleteStu(offsets: [0])
            }
          
            
        }
    }
    
    func addStu(phone: String, password: String){
        let student = Person(context: viewContext)
        student.id = UUID()
        student.phone = phone
        student.password = password
        student.userId = Int16(1)
        student.realName = "蔚宝"
        try? viewContext.save()
    }
    
    func deleteStu(offsets: IndexSet){
        offsets.forEach{ index in
            let stu = self.persons[index]
            
            viewContext.delete(stu)
        }
        
        saveContext()
    }
    
    func selectStu(index: Int) -> Person{
       return self.persons[index]
    }

    func saveContext() {
          do {
            try viewContext.save()
          } catch {
            print("Error saving managed object context: \(error)")
          }
        }
    }
//}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
