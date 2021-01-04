//
//  EmployeePicker.swift
//  YardRemote Dev
//
//  Created by Felipe Galindo on 12/24/20.
//

import SwiftUI

struct EmployeeOverviewPicker: View {
    var employeeT: (Employee, Bool)
    
    var body: some View {
        ZStack{
            let (employee, seleted) = employeeT
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
                
                .fill(seleted ? Color.red :  Color.green)
        }
    }
}


struct EmployeesPicker: View {
    var employees: [(Employee, Bool)]
    var body: some View {
        LazyVStack{
            Text("There are \(employees.count) Employees in the database:")
            ForEach(0 ..< employees.count,id: \.self){num in
                Button(action: {
                    
                }) {
                    EmployeeOverviewPicker(employeeT: employees[num])
                        .background(Color(UIColor.systemBackground).opacity(0.7))
                        .cornerRadius(15)
                }
            }
        }
    }
}

struct EmployeesListPicker: View {
    @Binding var selectedIDs: [String]
    @ObservedObject public var employeesSO = EmployeeViewModel()
    @State var employeesT: [(Employee, Bool)] = []
    
    func getEmployeesT(employees : [Employee]) -> [(Employee, Bool)] {
        var returnvalue: [(Employee, Bool)] = []
        for employee in employees {
            returnvalue.append((employee,false))
        }
        return returnvalue
    }
    
    var body: some View{
            ScrollView{
                ZStack{
                    
                    Rectangle()
                    .fill(Color(UIColor.systemFill))
                    VStack{
                        EmployeesPicker(employees: getEmployeesT(employees: employeesSO.employeesDB))
                            .onAppear(){
                            employeesSO.getEmployees()
                        }
                        
                        Button(action: {
                            isUpdating = true
                            employeesSO.getEmployees()
                            employeesT = getEmployeesT(employees: employeesSO.employeesDB)
                        }, label: {
                            refreshButton(isUpdating: isUpdating)
                        })
                    }
                }
        }
    }
}

struct EmployeePicker_Previews: PreviewProvider {
    static var previews: some View {
        Text("no worko")
    }
}
