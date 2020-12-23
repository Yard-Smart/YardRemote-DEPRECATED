//
//  Employee.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation

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
