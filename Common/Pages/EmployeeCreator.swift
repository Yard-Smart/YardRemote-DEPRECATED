//
//  EmployeeCreator.swift
//  YardRemote Dev
//
//  Created by Felipe Galindo on 12/23/20.
//

import SwiftUI

var isSubmittingEmployee = false


struct submitEmployeeButton : View {
    var isSubmittingEmployee: Bool

    var body: some View {
        Rectangle()
            .fill(isSubmittingEmployee ? Color.blue :  Color.green)
        .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 100, idealHeight: 100, maxHeight: 200, alignment: .center)
        .cornerRadius(10)
        .overlay(
            VStack{
                HStack {
                    Text(isSubmittingEmployee ? "Uploading.." : "Submit Data")
                        .foregroundColor(Color(UIColor.label))
                        .font(.system(size: 40, weight: .black, design: .default))
                }
            }.padding(5)
        )
    }
}


func saveEmployee(employee: Employee) {
    do {
        let _ = try db.collection("Employees").addDocument(from: employee)
        isSubmittingEmployee = false

      }
      catch {
        print(error)
      }
    return
}



struct EmployeeCreator: View {

    @State var employee: Employee = Employee(id: UUID().uuidString, name: "", creatorID: "", address: "", imageID: "", email: "", phoneNumber: "", balance: "", hours: 0, isActive: true, payHistory: [], messages: [Message(id: UUID().uuidString, timeSent: String(Date().timeIntervalSince1970), senderID: "\(username) in \(appname)", recipientID: "database", title: "", message: "")])
    var body: some View {
        ScrollView{
            Rectangle()
            .fill(Color(UIColor.systemFill))
            .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 10, idealHeight: 40, maxHeight: 40, alignment: .center)
            .cornerRadius(30)
            .overlay(
                HStack{
                    TextField("Type Name", text: $employee.name)
                        .font(.system(size: 40, weight: .black, design: .default))
                        .padding(15)
                }
                
            )
            Rectangle()
            .fill(Color(UIColor.systemFill))
            .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 10, idealHeight: 40, maxHeight: 40, alignment: .center)
            .cornerRadius(30)
            .overlay(
                HStack{
                    TextField("Type Address", text: $employee.address)
                        .font(.system(size: 20, weight: .black, design: .default))
                        .padding(15)
                }
                
            )
            Rectangle()
            .fill(Color(UIColor.systemFill))
            .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 10, idealHeight: 40, maxHeight: 40, alignment: .center)
            .cornerRadius(30)
            .overlay(
                HStack{
                    TextField("Type Description", text: $employee.messages[0].message)
                        .font(.system(size: 20, weight: .black, design: .default))
                        .padding(15)
                }
                
            )
            Rectangle()
            .fill(Color(UIColor.systemFill))
            .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 10, idealHeight: 40, maxHeight: 40, alignment: .center)
            .cornerRadius(30)
            .overlay(
                HStack{
                    TextField("Type Position", text: $employee.messages[0].title)
                        .font(.system(size: 20, weight: .black, design: .default))
                        .padding(15)
                }
                
            )
            Rectangle()
            .fill(Color(UIColor.systemFill))
            .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 10, idealHeight: 40, maxHeight: 40, alignment: .center)
            .cornerRadius(30)
            .overlay(
                HStack{
                    TextField("Type email", text: $employee.email)
                        .font(.system(size: 20, weight: .black, design: .default))
                        .padding(15)
                }
                
            )
            Rectangle()
            .fill(Color(UIColor.systemFill))
            .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 10, idealHeight: 40, maxHeight: 40, alignment: .center)
            .cornerRadius(30)
            .overlay(
                HStack{
                    TextField("Type Phone Number", text: $employee.phoneNumber)
                        .font(.system(size: 20, weight: .black, design: .default))
                        .padding(15)
                }
                
            )
            Button(action: {
                isSubmittingEmployee = true
                saveEmployee(employee: employee)
                employee = Employee(id: UUID().uuidString, name: "", creatorID: "", address: "", imageID: "", email: "", phoneNumber: "", balance: "", hours: 0, isActive: true, payHistory: [], messages: [Message(id: UUID().uuidString, timeSent: String(Date().timeIntervalSince1970), senderID: "\(username) in \(appname)", recipientID: "database", title: "", message: "")])
            }) {
                submitEmployeeButton(isSubmittingEmployee: isSubmittingEmployee)
            }

        }
    }
}

struct EmployeeCreator_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeCreator()
    }
}
