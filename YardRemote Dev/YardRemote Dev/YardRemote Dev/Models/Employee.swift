//
//  Employee.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Employee: Codable, Identifiable{
    @DocumentID var id: String?
    var name: String
    var creatorID: String
    var address: String
    var imageID: String
    var email: String
    var phoneNumber: String
    var balance: String
    var hours: Int
    var isActive: Bool
    var payHistory: [Bill]
    var messages: [Message]
}

let tstEmployee = Employee(id: "felg", name: "Felipe Galindo", creatorID: "Felg", address: "315 S Basswood Ave", imageID: "felg", email: "felipht@hotmail.com", phoneNumber: "628-222-4642",balance: "0", hours: 0, isActive: true, payHistory: [], messages: [Message(id: "tstmsg", timeSent: "0.0", senderID: "Felg", recipientID: "", title: "", message: "cool dude ")])
