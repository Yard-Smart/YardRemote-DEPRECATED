//
//  manageEmployees.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/19/20.
//

import SwiftUI
import Firebase
import FirebaseFirestore




struct manageEmployees: View {
    var body: some View {
        ScrollView{
            VStack{
                Section(header:
                    HStack {
                        Spacer()
                        Text("Employee List")
                            .font(.system(size: 26, weight: .black, design: .default))
                }) {
                    employeeList(employees: [tstEmployee])
                    
                }
                
                Section(header:
                    HStack {
                        Spacer()
                        Text("Edit/Lookup Employee Info")
                            .font(.system(size: 26, weight: .black, design: .default))
                }) {
                    editEmployee()
                }
                
                Section(header:
                    HStack {
                        Spacer()
                        Text("Add Employee")
                            .font(.system(size: 26, weight: .black, design: .default))
                }) {
                    addEmployee()
                }
                
            }
        }
    }
}

struct manageEmployees_Previews: PreviewProvider {
    static var previews: some View {
        manageEmployees()
    }
}

