//
//  Message.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/27/20.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Message: Codable, Identifiable {
    var id: String
    var timeSent: String
    var senderID: String
    var recipientID: String
    var title: String
    var message: String
    
}
