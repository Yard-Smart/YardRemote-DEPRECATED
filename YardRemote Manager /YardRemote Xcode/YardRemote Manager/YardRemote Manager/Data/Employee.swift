//
//  Employee.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/19/20.
//

import Foundation

import Firebase

struct Employee: Identifiable, Hashable, Equatable{
    let id: String
    let name: String
    let creatorID: String
    let address: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func ==(lhs: Employee, rhs: Employee) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
    var dictionary: [String: Any] {
      return [
        "id": id,
        "name": name,
        "creatorID": creatorID,
        "address": address,
      ]
    }
    
}
let tstEmployee = Employee(id: "felg", name: "Felipe Galindo", creatorID: "Felg", address: "315 S Basswood Ave")
//extension Employee: DocumentSerializable {
//    init?(dictionary: [String : Any]) {
//      guard let id = dictionary["id"] as? String,
//          let name = dictionary["name"] as? String,
//          let creatorID = dictionary["creatorID"] as? String,
//          let address = dictionary["address"] as? Int else { return nil }
//
//      self.init(id : id,
//                name : name,
//                creatorID : creatorID,
//                address : address)
//    }
//}


