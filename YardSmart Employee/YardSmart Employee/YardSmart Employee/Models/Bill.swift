//
//  Bill.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation

struct Bill: Identifiable {
    let id: String
    let time: String
    let date: String
    let title: String
    let amount: String
    let messages: [Message]
}
