//
//  EmployeeViewer.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/23/20.
//

import SwiftUI

//struct employeeOverview: View {
//    var employee: Employee
//    var body: some View {
//        ZStack{
//            VStack{
//                HStack{
//                    ZStack{
//                        Text(employee.name).foregroundColor(Color.green)
//                        RoundedRectangle(cornerRadius: 10, style: .circular)
//                            .fill(Color(UIColor.secondarySystemFill))
//                    }
//                    Spacer()
//                    RoundedRectangle(cornerRadius: 10, style: .circular)
//                        .fill(Color(UIColor.systemFill).opacity(0))
//
//                }
//
//                HStack{
//                    ZStack{
//                        Text(employee.address)
//                        RoundedRectangle(cornerRadius: 10, style: .circular)
//                            .fill(Color(UIColor.tertiarySystemFill))
//                    }
//                    Spacer()
//                }
//                HStack{
//                    ZStack{
//                        HStack {
//                            Text("CreatorID:")
//                            Text(employee.creatorID)
//                        }
//                        RoundedRectangle(cornerRadius: 10, style: .circular)
//                            .fill(Color(UIColor.tertiarySystemFill))
//                    }
//                    ZStack{
//                        HStack {
//                            Text("ID:")
//                            Text(employee.id ?? "Failed to get ID")
//                        }
//                        RoundedRectangle(cornerRadius: 10, style: .circular)
//                            .fill(Color(UIColor.tertiarySystemFill))
//                    }
//                }
//
//            }
//            RoundedRectangle(cornerRadius: 10, style: .circular)
//                .fill(Color(UIColor.systemFill))
//        }
//    }
//}
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
    @ObservedObject public var employeesSO : EmployeeViewModel
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


struct EmployeeViewer_Previews: PreviewProvider {
    static var previews: some View {
        //EmployeeViewer()
        Text("no worko")
    }
}
