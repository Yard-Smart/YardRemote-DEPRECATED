//
//  AccountData.swift
//  Let Me Know
//
//  Created by Felipe Galindo on 11/29/20.
//

import Foundation


let tstAccount = AccountData(
    id: "tst",
    ownerName: "Bea O’Problem",
    amountDue: "$37,990.94",
    dueDate: "Nov 29 2020",
    messages: [Message(
        id:"msgtst1a",
        time:"",
        date:"",
        senderUID: "Felipe G",
        recipientUID: "",
        title: "Payment Reminder",
        
        message: "Please Complete Payment "),
               Message(
       id:"msgtst2a",
       time:"",
       date:"",
       senderUID: "Felipe G",
       recipientUID: "",
       title: "Overdue Payment Notice",
       message: "payment overdue")
    ],
    isOverdue: true,
    address: [
        AddressData(
            id: "tstadd1",
            name: "672 myAss Ave",
            ownerID: "tst",
            Address: "672 myAss Ave, Duluth MN 55804",
            messages: [Message(
                id:"msgtst1a",
                time:"recomendation: stump",
                date:"",
                senderUID: "",
                recipientUID: "",
                title: "recomendetion to stump in frontyard",
                message: "Serviceman recomends removing stump in frontyard"),
                       Message(
               id:"msgtst2a",
               time:"",
               date:"",
               senderUID: "",
               recipientUID: "",
               title: "Backyard Needs to be Fertilized",
               message: "Backyard Needs to be Fertilized haha")
            ],
            isActive: true,
            billHistory: [Bill(
                id: "tstbll",
                time: "1 PK",
                date: "Yesterday",
                title: "Cleaned Snow",
                amount: "$30",
                messages: [
                    Message(
                        id:"bmsgtst1",
                        time:"",
                        date:"",
                        senderUID: "",
                        recipientUID: "",
                        title: "",
                        message: "Cleaned snow on sidewalk and parking lot.")
                    
                ])
            ],
            avaliableActions: tstOfferedActions
        ),
        AddressData(
            id: "tstadd2",
            name: "4781 Big Dick St",
            ownerID: "tst",
            Address: "4781 Big Dick St, Duluth MN 55812",
            messages: [Message(
                id:"msgtst1",
                time:"",
                date:"",
                senderUID: "",
                recipientUID: "",
                title: "Grass not cut in a while!",
                message: "Cut the grass. Grass not cut in a while!"),
                       Message(
               id:"msgtst2",
               time:"",
               date:"",
               senderUID: "",
               recipientUID: "",
               title: "Recomended grass cut",
               message: "Grass needs to be cut")
            ],
            isActive: true,
            billHistory: [Bill(
                id: "tstbll",
                time: "1 PK",
                date: "Today",
                title: "Cleaned Snow",
                amount: "$30",
                messages: [
                    Message(
                        id:"bmsgtst1",
                        time:"",
                        date:"",
                        senderUID: "",
                        recipientUID: "",
                        title: "",
                        message: "Cleaned snow on sidewalk and parking lot.")
                ])
            ],
            avaliableActions: tstOfferedActions
        )
    ]
)

let tstmsgs = [Message(
                id:"msgtst1",
                time:"",
                date:"",
                senderUID: "",
                recipientUID: "",
                title: "",
                message: "Grass not cut in a while!"),
               Message(
                   id:"msgtst2",
                   time:"",
                   date:"",
                   senderUID: "",
                   recipientUID: "",
                   title: "",
                   message: "Grass needs to be cut"),
                   Message(
                       id:"msgtst1a",
                   time:"",
                   date:"",
                   senderUID: "",
                   recipientUID: "",
                   title: "",
                   message: "Serviceman recomends removing stump in frontyard"),
                          Message(
                  id:"msgtst2a",
                  time:"",
                  date:"",
                  senderUID: "",
                  recipientUID: "",
                  title: "",
                  message: "Backyard Needs to be Fertilized haha")]

struct Action: Identifiable, Hashable, Equatable{
    let id: String
    let name: String
    let avaliability: String
    let recomended: Bool
    let suggestedExecution: String
    let executionTime: String
    let executionCost: String
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func ==(lhs: Action, rhs: Action) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}
let tstOfferedActions = [Action(
    id: "ac1",
    name: "Clean Snow",
    avaliability: "Tomorrow morning",
    recomended: true,
    suggestedExecution: "ASAP",
    executionTime: "10m",
    executionCost: "$100"
    ),Action(
    id: "ac2",
    name: "SUk CoK",
    avaliability: "Tomorrow morning",
    recomended: true,
    suggestedExecution: "ASAP",
    executionTime: "1m",
    executionCost: "$10000"
    )]

struct Message: Identifiable {
    let id: String
    let time: String
    let date: String
    let senderUID: String
    let recipientUID: String
    let title: String
    let message: String
}

struct Bill: Identifiable {
    let id: String
    let time: String
    let date: String
    let title: String
    let amount: String
    let messages: [Message]
    
    
    
}

struct AddressData: Identifiable, Hashable, Equatable{
    let id: String
    let name: String
    let ownerID: String
    let Address: String
    let messages: [Message]
    let isActive: Bool
    let billHistory: [Bill]
    let avaliableActions: [Action]
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func ==(lhs: AddressData, rhs: AddressData) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}



struct AccountData: Identifiable {
    let id: String
    let ownerName: String
    let amountDue: String
    let dueDate: String
    let messages: [Message]
    let isOverdue: Bool
    let address: [AddressData]
}
