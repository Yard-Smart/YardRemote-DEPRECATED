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
    var isTest: Bool
    var hasStarted: Bool
    var employeeIDs: [String]
    var messages: [Message]
    var events: [Event]
}


class JobsViewModel: ObservableObject {
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
                isUpdating = false
            }
            
        }
    }
}

struct JobOverview: View {
    var job: Job
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Text(job.locationID).foregroundColor(Color.green)
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.secondarySystemFill))
                    }
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(job.isTest ? Color.black : Color(UIColor.systemFill).opacity(0))
                        Text(job.isTest ? "test" : "")
                    }
                    

                }
                
                HStack{
                    ZStack{
                        Text(job.messages[0].message)
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    Spacer()
                }
                HStack{
                    ZStack{
                        HStack {
                            Text("CreatorID:")
                            if !job.employeeIDs.isEmpty{
                                Text(job.employeeIDs[0])
                            }
                            

                            
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    ZStack{
                        HStack {
                            Text("ID:")
                            Text(job.id ?? "no id")
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                }
                
            }
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.systemFill))
        }
    }
}

struct JobEditor: View {
    var job: Job
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Text(job.locationID).foregroundColor(Color.green)
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.secondarySystemFill))
                    }
                    Spacer()
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.systemFill).opacity(0))

                }
                
                HStack{
                    ZStack{
                        Text(job.messages[0].message)
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    Spacer()
                }
                HStack{
                    ZStack{
                        HStack {
                            Text("CreatorID:")
                            Text(job.employeeIDs[0])
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    ZStack{
                        HStack {
                            Text("ID:")
                            Text(job.id ?? "no id")
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                }
                
            }
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.systemFill))
        }
    }
}

struct JobViewer: View {
    var job: Job
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    ZStack{
                        Text(job.locationID).foregroundColor(Color.green)
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.secondarySystemFill))
                    }
                    Spacer()
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.systemFill).opacity(0))

                }
                
                HStack{
                    ZStack{
                        Text(job.messages[0].message)
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    Spacer()
                }
                HStack{
                    ZStack{
                        HStack {
                            Text("CreatorID:")
                            Text(job.employeeIDs[0])
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    ZStack{
                        HStack {
                            Text("ID:")
                            Text(job.id ?? "no id")
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                }
                
            }
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color(UIColor.systemFill))
        }
    }
}


struct JobsViewer: View {
    var jobs: [Job]
    var body: some View {
        LazyVStack{
            Text("There are \(jobs.count) Jobs in the database:")
            ForEach(0 ..< jobs.count,id: \.self){num in
                NavigationLink(
                    destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
                    label: {
                        JobOverview(job: jobs[num])
                    })
                
                    
                    .background(Color(UIColor.systemBackground).opacity(0.7))
                .cornerRadius(15)
            }
        }
    }
}
