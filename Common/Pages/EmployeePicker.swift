//
//  EmployeePicker.swift
//  YardRemote Dev
//
//  Created by Felipe Galindo on 12/24/20.
//

import SwiftUI
var isUpdatingEmployees : Bool = false

struct refreshEmployeesButton : View{
    var isUpdating: Bool
    var body: some View{
        Rectangle()
            .fill(isUpdatingEmployees ? Color.blue :  Color.green)
        .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 60, idealHeight: 60, maxHeight: 200, alignment: .center)
        .cornerRadius(10)
        .overlay(
            VStack{
                HStack {
                    Text(isUpdatingEmployees ? "Updating..." : "Refresh")
                        .foregroundColor(Color(UIColor.label))
                        .font(.system(size: 40, weight: .black, design: .default))
                }
            }.padding(5)
        )
    }
}

struct EmployeeOverviewPicker: View {
    var employeeT: (Employee, Bool)
    
    var body: some View {
        ZStack{
            let (employee, seleted) = employeeT
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(seleted ? Color.red :  Color.green)
            VStack{
                ZStack(alignment: .leading){
                    Text(employee.name).font(.largeTitle)
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
        }
    }
}


struct EmployeesPicker: View {

    @Binding var employees: [(Employee, Bool)]
    var body: some View {
        LazyVStack{
            ForEach(0 ..< employees.count,id: \.self){num in
                
                
                Button(action: {
                    employees[num].1.toggle()
                    
                }) {
                    EmployeeOverviewPicker(employeeT: employees[num])
                        .foregroundColor(Color.black)
                        .cornerRadius(15)
                }
            }
        }
    }
}

func saveSelectedIDs(employeesT : [(Employee, Bool)]){
    var returnvalue: [String] = []
    for employee in employeesT {
        if employee.1{
            returnvalue.append(employee.0.id ?? "no id")
        }
    }
    selectedIDs = returnvalue
    return
}

struct EmployeesListPicker: View {
    @Binding var selectedIDs: [String]
    @ObservedObject public var employeesSO : EmployeeViewModel
    
    
    func getEmployeesT(employees : [Employee]){
        var returnvalue: [(Employee, Bool)] = []
        for employee in employees {
            returnvalue.append((employee,false))
        }
        employeesT = returnvalue
        return
    }
    
    
    
    var body: some View{
            ScrollView{
                ZStack{
                    
                    Rectangle()
                    .fill(Color(UIColor.systemFill))
                    VStack{
                        Text("You have selected \(selectedIDs.count) Employees")

                        EmployeesPicker(employees: $employeesT)
                            .onAppear(){
                            employeesSO.getEmployees()
                        }
                        
                        Button(action: {
                            isUpdating = true
                            employeesSO.getEmployees()
                            getEmployeesT(employees: employeesSO.employeesDB)
                        }, label: {
                            refreshEmployeesButton(isUpdating: isUpdating)
                        })
                        
                    }
                }.onAppear {
                    getEmployeesT(employees: employeesSO.employeesDB)
                }
                .onDisappear(){
                    saveSelectedIDs(employeesT: employeesT)
                }
            }
        
    }
}

struct EmployeePicker_Previews: PreviewProvider {
    static var previews: some View {
        Text("no worko")
    }
}
