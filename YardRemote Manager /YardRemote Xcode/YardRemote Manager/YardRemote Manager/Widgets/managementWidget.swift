//
//  managementWidget.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/19/20.
//

import SwiftUI

let employeesREF = db.collection("employees")

struct managementWidget: View {
    var body: some View {
        HStack{
            VStack{
                NavigationLink(
                    destination: manageEmployees(),
                    label: {
                        bigButton(text: "Manage Employees", color: Color(UIColor.label))
                    }
                )
            }
        }
//        VStack{
//            Rectangle()
//            .fill(Color(UIColor.systemFill))
//            .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 40, idealHeight: 40, maxHeight: 40, alignment: .center)
//            .cornerRadius(30)
//            .overlay(
//                HStack{
//                    Text("Manage clients")
//                        .font(.system(size: 40, weight: .black, design: .default))
//                        .padding(15)
//                }
//            )
//            Rectangle()
//            .fill(Color(UIColor.systemFill))
//            .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 40, idealHeight: 40, maxHeight: 40, alignment: .center)
//            .cornerRadius(30)
//            .overlay(
//            NavigationLink(
//                destination: manageEmployees(),
//                label: {
//                    Text("Manage Employees")
//                        .font(.system(size: 40, weight: .black, design: .default))
//                        .padding(15)
//                }
//            )
//            )
//        }
    }
}

struct managementWidget_Previews: PreviewProvider {
    static var previews: some View {
        managementWidget()
    }
}
