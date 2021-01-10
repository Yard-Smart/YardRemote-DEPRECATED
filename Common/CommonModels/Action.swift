//
//  Action.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation

struct Action: Codable, Identifiable {
    let id: String
    let name: String
    let avaliability: String
    let recomended: Bool
    let suggestedExecution: String
    let executionTime: String
    let executionCost: String
}
