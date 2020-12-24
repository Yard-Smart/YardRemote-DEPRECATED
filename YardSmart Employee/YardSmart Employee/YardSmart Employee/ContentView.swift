//
//  ContentView.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import SwiftUI

var ScreenH:CGFloat = UIScreen.main.bounds.height
var ScreenW:CGFloat = UIScreen.main.bounds.width


struct ContentView: View {
    @StateObject public var jobsSO = JobsViewModel()
    
    public func updateData() {
        jobsSO.getJobs()
    }
    
    var body: some View {
        ScrollView{
            JobsViewer(jobs: jobsSO.jobsDB).onAppear(){
                jobsSO.getJobs()
            }
            NewJobWidget()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
