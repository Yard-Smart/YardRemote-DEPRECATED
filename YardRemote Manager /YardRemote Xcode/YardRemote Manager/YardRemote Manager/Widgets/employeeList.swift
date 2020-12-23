//
//  employeeList.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/20/20.
//

import SwiftUI

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
                            Text(employee.id)
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

struct employeeList_Previews: PreviewProvider {
    static var previews: some View {
        employeeList(employees: [tstEmployee])
    }
}
