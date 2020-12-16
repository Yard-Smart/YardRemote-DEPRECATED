//
//  Job.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/16/20.
//

import Foundation

struct Job: Identifiable, Hashable, Equatable{
    let id: String
    let name: String
    let CreatorID: String
    let EmployeesIDs: [String]
    let address: String
    let startLatitude: String
    let startLongitude: String
    let startTime: String
    let endLatitude: String
    let endLongitude: String
    let endTime: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func ==(lhs: Job, rhs: Job) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}
