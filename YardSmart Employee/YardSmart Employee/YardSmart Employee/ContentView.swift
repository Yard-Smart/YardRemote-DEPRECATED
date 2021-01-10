//
//  ContentView.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/22/20.
//

import SwiftUI

var ScreenH:CGFloat = UIScreen.main.bounds.height
var ScreenW:CGFloat = UIScreen.main.bounds.width
var username: String = "Felg"
var appname: String = "YardRemote Dev"
let appID: String = UIDevice.current.identifierForVendor?.uuidString ?? "Failed to get UUID \(username) @ \(appname)"

//vasiables for the size of the top bar
var TopH:CGFloat = 80
var testModeEnabled = true





//Top bar
struct LandingPageTop: View {
    @Binding var isInHomeScreen: Bool
    var body: some View {
        if isInHomeScreen{
            Rectangle()
            .fill(Color(UIColor.systemBlue))
            .frame(width: ScreenW, height: TopH)
            .overlay(
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("YardRemote Employee")
                        .font(.system(size: 30, weight: .black, design: .default))
                        
                    Spacer()
                }
            }
            )
        }
    }
}


struct ContentView: View {
    @ObservedObject public var employeesSO = EmployeeViewModel()
    @State var isInHomeScreen = true
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    NewJobWidget(employeesSO: employeesSO)
                        .padding(5)
                    Spacer()
                    InfoWidget(isInTestMode: testModeEnabled)
                    NavigationLink(destination: PastJobsWidget()) {
                        smallButton(text: "See Past Jobs", color: Color.blue)
                    }
                }
            }.onAppear(){
                isInHomeScreen = true
            }
            .onDisappear(){
                isInHomeScreen = false
            }
        }
        .overlay(VStack {
            LandingPageTop(isInHomeScreen: $isInHomeScreen).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
        })
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Job(id: UUID().uuidString, startTime: String(Date().timeIntervalSince1970), endTime: String(Date().timeIntervalSince1970), locationID: "", isDone: false, isTest: true, hasStarted: false, employeeIDs: [], messages: [Message(id: UUID().uuidString, timeSent: String(Date().timeIntervalSince1970), senderID: "app", recipientID: "server", title: "", message: "")], events: [])


//There should be more than one kind of client types some can carry a balance and others you just bill them automaticaly when an Job is reported.
