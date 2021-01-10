//
//  Bill.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/19/20.
//

import Foundation

struct Address: Identifiable, Hashable, Equatable{
    let id: String
    let ownerID: String
    let name: String
    let address: String
    let latitude: String
    let longitude: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func ==(lhs: Address, rhs: Address) -> Bool {
        return lhs.address == rhs.address && lhs.id == rhs.id
    }
}
