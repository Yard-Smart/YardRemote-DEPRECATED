//
//  Employee.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

var isUpdatingEmployee = false

struct Employee: Codable, Identifiable{
    @DocumentID var id: String?
    var name: String
    var creatorID: String
    var address: String
    var imageID: String
    var email: String
    var phoneNumber: String
    var balance: String
    var hours: Int
    var isActive: Bool
    var payHistory: [Bill]
    var messages: [Message]
}

class EmployeeViewModel: ObservableObject {
    @Published var employeesDB : [Employee] = []
    
    func getEmployees(){
        
        // since were having only one set in firestore so were going to fetch that one only..
        // you can add round 2,3... into firestore and can be fetched....
        
        // change this to set.....
        db.collection("Employees").getDocuments { (employee, err) in
            
            guard let data = employee else{return}
            
            DispatchQueue.main.async {
                self.employeesDB = data.documents.compactMap({ (doc) -> Employee? in
                    return try? doc.data(as:Employee.self)
                })
                isUpdatingEmployee = false
            }
            
        }
    }
}

struct editEmployee: View {
    @State private var search_string: String = ""
    @State private var isExpanded: Bool =  false
    @State private var employees: [Employee] = []

    let employeesDB = Firestore.firestore().collection("Employees")

    var body: some View{
        Rectangle()
            .fill(Color(UIColor.systemFill))
        .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 40, idealHeight: 60, maxHeight: 100, alignment: .center)
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
                .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .center)
            }
        }
    }
}

//struct addEmployee: View {
//    let font_size: CGFloat = 20
//    @State private var hasSubmitted = false
//
//    @State private var id = ""
//    @State private var name = ""
//    @State private var creatorID = ""
//    @State private var address = ""
//    var body: some View {
//        VStack{
//            HStack{
//                Text("id").font(.system(size: font_size, weight: .black, design: .default))
//                    .padding(15)
//                TextField("Type id", text: $id)
//                    .font(.system(size: font_size, weight: .black, design: .default))
//                    .padding(15)
//            }
//            HStack{
//                            Text("name").font(.system(size: font_size, weight: .black, design: .default))
//                                .padding(15)
//                            TextField("Type name", text: $name)
//                                .font(.system(size: font_size, weight: .black, design: .default))
//                                .padding(15)
//                        }
//            HStack{
//                            Text("creatorID").font(.system(size: font_size, weight: .black, design: .default))
//                                .padding(15)
//                            TextField("Type creatorID", text: $creatorID)
//                                .font(.system(size: font_size, weight: .black, design: .default))
//                                .padding(15)
//                        }
//            HStack{
//                            Text("address").font(.system(size: font_size, weight: .black, design: .default))
//                                .padding(15)
//                            TextField("Type address", text: $address)
//                                .font(.system(size: font_size, weight: .black, design: .default))
//                                .padding(15)
//            }
//            Rectangle()
//            .fill(Color.gray)
//            .frame(minWidth: 180, idealWidth: 400, maxWidth: 400, minHeight: 50, idealHeight: 50, maxHeight: 100, alignment: .center)
//            .cornerRadius(10)
//            .overlay(
//                VStack{
//                    HStack {
//                        Text("Submit")
//                            .foregroundColor(Color(UIColor.label))
//                            .font(.system(size: 20, weight: .black, design: .default))
//
//
//                    }
//
//                }.padding(5)
//
//            ).onTapGesture {
//                //self.id, self.name, self.creatorID, self.address = "", "", "", ""
//                let newEmployee = Employee(id: id, name: name, creatorID: creatorID, address: address)
//                Firestore.firestore().collection("employees").addDocument(data:newEmployee.dictionary)
//            }
//        }
//    }
//}

struct employeeOverview: View {
    var employee: Employee
    var body: some View {
        ZStack{

            VStack{
                HStack{
                    ZStack{
                        Text(employee.name).foregroundColor(Color.green)
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.secondarySystemFill))
                    }
                    Spacer()
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.systemFill).opacity(0))

                }
                
                HStack{
                    ZStack{
                        Text(employee.address)
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    Spacer()
                }
                HStack{
                    ZStack{
                        HStack {
                            Text("CreatorID:")
                            Text(employee.creatorID)
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    ZStack{
                        HStack {
                            Text("ID:")
                            Text(employee.id ?? "Failed to get ID")
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                }
                
            }
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.systemFill))
        }
    }
}

struct employeeList: View {
    @State var employees: [Employee]
    
    var body: some View {
        LazyVStack{
            ForEach(employees){employee in
                employeeOverview(employee:employee)
            }
        }
    }
}

struct EmployeeOverview: View {
    var employee : Employee
    var body: some View {
        ZStack{
            VStack{
                ZStack(alignment: .leading){
                    Text(employee.name).foregroundColor(Color.green).font(.largeTitle)
                        .padding(10)
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.secondarySystemFill))
                }
                
                ZStack{
                    Text(employee.messages[0].title)
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.tertiarySystemFill))
                }
                
                ZStack{
                    HStack {
                        Text("ID:")
                        Text(employee.id ?? "no id")
                    }
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.tertiarySystemFill))
                }
                HStack{
                    ZStack{
                        HStack {
                            Text("Balance:")
                            Text(employee.balance)
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    
                    ZStack{
                        HStack {
                            Text("Hours:")
                            Text("\(employee.hours)")
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    
                }
                
                
            }
            .padding(10)
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.systemFill))
        }
    }
}


struct EmployeeViewer: View {
    var employee : Employee
    var body: some View {
        ZStack{
            VStack{
                ZStack(alignment: .leading){
                    Text(employee.name).foregroundColor(Color.green).font(.largeTitle)
                        .padding(10)
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.secondarySystemFill))
                }
                
                ZStack{
                    Text(employee.messages[0].title)
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.tertiarySystemFill))
                }
                Spacer()
                
                ZStack{
                    HStack {
                        Text("ID:")
                        Text(employee.id ?? "no id")
                    }
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.tertiarySystemFill))
                }
                HStack{
                    ZStack{
                        HStack {
                            Text("CreatorID:")
                            Text(employee.creatorID)
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    ZStack{
                        HStack {
                            Text("ImageID:")
                            Text(employee.imageID)
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                }
                
                ZStack{
                    HStack {
                        Text("email:")
                        Text(employee.email)
                    }
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.tertiarySystemFill))
                }
                
                ZStack{
                    HStack {
                        Text("Phone Number:")
                        Text(employee.phoneNumber)
                    }
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.tertiarySystemFill))
                }
                
                ZStack{
                    HStack {
                        Text("Created:")
                        Text(employee.messages[0].timeSent)
                    }
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.tertiarySystemFill))
                }
                ZStack{
                    HStack {
                        Text("Balance:")
                        Text(employee.balance)
                    }
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.tertiarySystemFill))
                }

                
            }
            .padding(10)
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.systemFill))
        }
    }
}

struct EmployeesViewer: View {
    var employees: [Employee]
    var body: some View {
        LazyVStack{
            Text("There are \(employees.count) Employees in the database:")
            ForEach(0 ..< employees.count,id: \.self){num in
                NavigationLink(destination: EmployeeViewer(employee: employees[num])) {
                    EmployeeOverview(employee: employees[num])
                        .background(Color(UIColor.systemBackground).opacity(0.7))
                        .cornerRadius(15)
                }
            }
        }
    }
}



struct EmployeesList: View {
    @ObservedObject public var employeesSO = EmployeeViewModel()
    var body: some View{
            ScrollView{
                ZStack{
                    Rectangle()
                    .fill(Color(UIColor.systemFill))
                    VStack{
                        EmployeesViewer(employees: employeesSO.employeesDB).onAppear(){
                            employeesSO.getEmployees()
                        }
                        
                        Button(action: {
                            isUpdating = true
                            employeesSO.getEmployees()
                        }, label: {
                            refreshButton(isUpdating: isUpdating)
                        })
                    }
                }
        }
    }
}

let tstEmployee = Employee(id: "felg", name: "Felipe Galindo", creatorID: "Felg", address: "315 S Basswood Ave", imageID: "felg", email: "felipht@hotmail.com", phoneNumber: "628-222-4642",balance: "0", hours: 0, isActive: true, payHistory: [], messages: [Message(id: "tstmsg", timeSent: "0.0", senderID: "Felg", recipientID: "", title: "", message: "cool dude ")])

