//
//  JobViewModel.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/23/20.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift


class JobViewModel: ObservableObject {

    @Published var jobsDB : [Job] = []
    
    func getJobs(){
        
        // since were having only one set in firestore so were going to fetch that one only..
        // you can add round 2,3... into firestore and can be fetched....
        
        // change this to set.....
        db.collection("Jobs").getDocuments { (job, err) in
            
            guard let data = job else{return}
            
            DispatchQueue.main.async {
                self.jobsDB = data.documents.compactMap({ (doc) -> Job? in
                    return try? doc.data(as:Job.self)
                })
            }
            
        }
    }
}
