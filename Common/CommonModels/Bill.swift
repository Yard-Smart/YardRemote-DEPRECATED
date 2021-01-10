//
//  Bill.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Bill: Identifiable, Codable {
    @DocumentID var id: String?
    let time: String
    let date: String
    let title: String
    let amount: String
    let isSettled: Bool
    let hasBeenNotified: Bool
    let locationID: Location
    let messages: [Message]
}
