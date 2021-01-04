//
//  Job.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift




struct Job: Codable, Identifiable {
    @DocumentID var id: String?
    var startTime: String
    var endTime: String
    var locationID: String
    var isDone: Bool
    var hasStarted: Bool
    var employeeIDs: [String]
    var messages: [Message]
    
}

struct Message: Codable, Identifiable {
    var id: String
    var timeSent: String
    var senderID: String
    var recipientID: String
    var title: String
    var message: String
    
}
