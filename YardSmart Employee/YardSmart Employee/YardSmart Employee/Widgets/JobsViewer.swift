//
//  JobViewer.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/23/20.
//

import SwiftUI

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
                JobViewer(job: jobs[num])
                    .onTapGesture {
                        
                    }
                    .background(Color(UIColor.systemBackground).opacity(0.7))
                .cornerRadius(15)
            }
        }
    }
}

struct JobViewer_Previews: PreviewProvider {
    static var previews: some View {
        Text("no")
    }
}
