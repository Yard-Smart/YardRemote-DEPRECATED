//
//  addEmployee.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/19/20.
//

import SwiftUI
import FirebaseFirestore
struct addEmployee: View {
    let font_size: CGFloat = 20
    @State private var hasSubmitted = false

    @State private var id = ""
    @State private var name = ""
    @State private var creatorID = ""
    @State private var address = ""
    var body: some View {
        VStack{
            HStack{
                Text("id").font(.system(size: font_size, weight: .black, design: .default))
                    .padding(15)
                TextField("Type id", text: $id)
                    .font(.system(size: font_size, weight: .black, design: .default))
                    .padding(15)
            }
            HStack{
                            Text("name").font(.system(size: font_size, weight: .black, design: .default))
                                .padding(15)
                            TextField("Type name", text: $name)
                                .font(.system(size: font_size, weight: .black, design: .default))
                                .padding(15)
                        }
            HStack{
                            Text("creatorID").font(.system(size: font_size, weight: .black, design: .default))
                                .padding(15)
                            TextField("Type creatorID", text: $creatorID)
                                .font(.system(size: font_size, weight: .black, design: .default))
                                .padding(15)
                        }
            HStack{
                            Text("address").font(.system(size: font_size, weight: .black, design: .default))
                                .padding(15)
                            TextField("Type address", text: $address)
                                .font(.system(size: font_size, weight: .black, design: .default))
                                .padding(15)
            }
            Rectangle()
            .fill(Color.gray)
            .frame(minWidth: 180, idealWidth: 400, maxWidth: 400, minHeight: 50, idealHeight: 50, maxHeight: 100, alignment: .center)
            .cornerRadius(10)
            .overlay(
                VStack{
                    HStack {
                        Text("Submit")
                            .foregroundColor(Color(UIColor.label))
                            .font(.system(size: 20, weight: .black, design: .default))

    
                    }
                        
                }.padding(5)
                
            ).onTapGesture {
                //self.id, self.name, self.creatorID, self.address = "", "", "", ""
                let newEmployee = Employee(id: id, name: name, creatorID: creatorID, address: address)
                Firestore.firestore().collection("employees").addDocument(data:newEmployee.dictionary)
            }
        }
    }
}

struct addEmployee_Previews: PreviewProvider {
    static var previews: some View {
        addEmployee()
    }
}
