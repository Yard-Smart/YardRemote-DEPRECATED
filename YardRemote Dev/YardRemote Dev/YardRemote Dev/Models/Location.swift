//
//  Location.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation
struct Location: Identifiable, Codable, Equatable{
    let id: String
    let name: String
    let ownerID: String
    let clientType: String
    let address: String
    let propertyManagerName: String
    let snowRemoval: Bool
    let lawnCare: Bool
    let scheduleLawnCare: String
    let priceLawnCareVisit: String
    let email: String
    let phone: String
    let notesLawnCare: String
    let lg: Bool
    let salt: String
    let TriggerSnowRemoval: String
    let billingStructureSnowRemoval: String
    let snowRemoval0to5in: String
    let snowRemoval5to10in: String
    let SnowRemoval10to15in: String
    let snowRemoval15to20in: String
    let hourlyRateSnowRemoval: String
    let billingSchedule: String
    let notesSnowRemoval: String
    let billHistory: [Bill]
    let messages: [Message]
    let avaliableActions: [Action]
    let isActive: Bool
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func ==(lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}

