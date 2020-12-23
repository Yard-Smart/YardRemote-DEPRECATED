//
//  Job.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation
import FirebaseFirestore



struct Job: Identifiable {
    var id: String
    var startTime: String
    var endTime: String
    var locationID: String
    var isDone: Bool
    var hasStarted: Bool
    var employeeIDs: [String]
    var messages: [Message]
    
    enum CodingKeys {
        case startTime
        case endTime
        case locationID
//        case employeeIDs
//        case messages
    }
}

struct Message: Identifiable {
    var id: String
    var timeSent: String
    var senderID: String
    var recipientID: String
    var title: String
    var message: String
    
}
