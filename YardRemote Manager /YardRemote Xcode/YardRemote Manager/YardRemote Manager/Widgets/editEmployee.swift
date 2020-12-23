//
//  editEmployee.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/19/20.
//

import SwiftUI
import FirebaseFirestore


struct editEmployee: View {
    @State private var search_string: String = ""
    @State private var isExpanded: Bool =  false
    @State private var employees: [Employee] = []
    
    let employeesDB = Firestore.firestore().collection("Employees")
    
    var body: some View{
        Rectangle()
            .fill(Color(UIColor.systemFill))
        .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 40, idealHeight: 60, maxHeight: 100, alignment: .center)
            .cornerRadius(50)
        .overlay(
            VStack{
                TextField("Type Address", text: $search_string)
                    .font(.system(size: 40, weight: .black, design: .default))
                    .onChange(of: search_string) { newValue in
                        if self.search_string != ""{
                            self.isExpanded = true
                        }else{
                            self.isExpanded = false
                        }
                        print("Searching for Employee: \(search_string)!")
                        let employeesDOC = employeesDB.whereField("name", arrayContains: search_string)
    

                    }

            }.padding(15)
        )
        DisclosureGroup("Results will show up here after you type a keyword", isExpanded: $isExpanded) {
            ScrollView(.horizontal){
                Rectangle()
                    .fill(Color(UIColor.systemFill))
                .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .center)
            }
        }
    }
}

struct editEmployee_Previews: PreviewProvider {
    static var previews: some View {
        editEmployee()
    }
}
