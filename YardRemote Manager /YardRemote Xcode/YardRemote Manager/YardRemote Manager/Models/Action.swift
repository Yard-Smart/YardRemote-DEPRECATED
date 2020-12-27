//
//  Action.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation

struct Action: Identifiable, Hashable, Equatable{
    let id: String
    let name: String
    let avaliability: String
    let recomended: Bool
    let suggestedExecution: String
    let executionTime: String
    let executionCost: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func ==(lhs: Action, rhs: Action) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}
