//
//  Event.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/30/20.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Event: Codable, Identifiable {
    var id: String
    var timeSent: String
    var senderID: String
    var title: String
    var message: String
    
}
