//
//  EnterView.swift
//  Bank
//
//  Created by FFF on 2022/3/13.
//

import SwiftUI

struct EnterView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    //coredate
    @FetchRequest(
        entity: Person.entity(), sortDescriptors: []
    ) var persons: FetchedResults<Person>
    
    var body: some View {
        NavigationView{
            if isEmptyPersons(){
                ContentView()  
            }
            else{
                LoginView()
//                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    func isEmptyPersons() -> Bool{
        if persons.isEmpty {
            return false
        }
        else{
            return true
        }
    }
}

//struct EnterView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterView()
//    }
//}
