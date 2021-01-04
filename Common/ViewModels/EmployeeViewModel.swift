//
//  EmployeeViewModel.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/23/20.
//

import Foundation
import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift
var isUpdatingEmployee = false

class EmployeeViewModel: ObservableObject {
    @Published var employeesDB : [Employee] = []
    
    func getEmployees(){
        
        // since were having only one set in firestore so were going to fetch that one only..
        // you can add round 2,3... into firestore and can be fetched....
        
        // change this to set.....
        db.collection("Employees").getDocuments { (employee, err) in
            
            guard let data = employee else{return}
            
            DispatchQueue.main.async {
                self.employeesDB = data.documents.compactMap({ (doc) -> Employee? in
                    return try? doc.data(as:Employee.self)
                })
                isUpdatingEmployee = false
            }
            
        }
    }
}
