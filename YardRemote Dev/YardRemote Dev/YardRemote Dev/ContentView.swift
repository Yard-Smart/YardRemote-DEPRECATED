//
//  ContentView.swift
//  YardRemote Dev
//
//  Created by Felipe Galindo on 12/23/20.
//

import SwiftUI
import Firebase

let calendar = NSCalendar.current
let db = Firestore.firestore()

var ScreenH:CGFloat = UIScreen.main.bounds.height
var ScreenW:CGFloat = UIScreen.main.bounds.width
var username: String = "Felg"
var appname: String = "YardRemote Dev"

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                NavigationLink(destination: EmployeesList()){
                    smallButton(text: "See Employees", color: Color.red)
                }
                EmployeeCreator()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
