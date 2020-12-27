//
//  Location.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation
struct Location: Identifiable, Hashable, Equatable{
    let id: String
    let name: String
    let ownerID: String
    let address: String
    let messages: [Message]
    let isActive: Bool
    let billHistory: [Bill]
    let avaliableActions: [Action]
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func ==(lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}
