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
    
    var body: some View {
        NavigationView{
            ScrollView{
                NavigationLink(destination: PastJobsWidget()){
                    smallButton(text: "See Past Jobs", color: Color.blue)
                }
                NewJobWidget()
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
