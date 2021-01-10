//
//  HomePage.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/16/20.
//

import SwiftUI
import Combine
import CoreLocation
import GoogleSignIn
import Firebase
import FirebaseFirestore

var TopH:CGFloat = 80
var TopW:CGFloat = UIScreen.main.bounds.width

let calendar = NSCalendar.current
let db = Firestore.firestore()

var ScreenH:CGFloat = UIScreen.main.bounds.height
var ScreenW:CGFloat = UIScreen.main.bounds.width
var username: String = "Felg"
var appname: String = "YardRemote Dev"
let appID: String = UIDevice.current.identifierForVendor?.uuidString ?? "Failed to get UUID \(username) @ \(appname)"

var testModeEnabled = true



//func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?)
//                -> Void ) {
//    // Use the last reported location.
//    if let lastLocation = locationManager.location {
//        let geocoder = CLGeocoder()
//
//        // Look up the location and pass it to the completion handler
//        geocoder.reverseGeocodeLocation(lastLocation,
//                    completionHandler: { (placemarks, error) in
//            if error == nil {
//                let firstLocation = placemarks?[0]
//                completionHandler(firstLocation)
//            }
//            else {
//             // An error occurred during geocoding.
//                completionHandler(nil)
//            }
//        })
//    }
//    else {
//        // No location was available.
//        completionHandler(nil)
//    }
//}





struct LandingPageTop: View {    
    var body: some View {
        Rectangle()
        .fill(Color(UIColor.systemGreen))
        .frame(width: TopW, height: TopH)
        .overlay(
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("YardRemote Manager")
                    .font(.system(size: 32, weight: .black, design: .default))
                    .edgesIgnoringSafeArea(.leading)
                    .edgesIgnoringSafeArea(.trailing)
                    
                Spacer()
            }
        }
        )
        }
}

struct HomePage: View {
    @ObservedObject public var employeesSO = EmployeeViewModel()
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color.gray)
                        VStack{
                            NavigationLink(destination: EmployeesList()){
                                smallButton(text: "See Employees", color: Color.red)
                            }
                            NavigationLink(destination: LocationsList()){
                                smallButton(text: "See Locations", color: Color.red)
                            }
                            NavigationLink(destination: PastJobsWidget()){
                                smallButton(text: "See Jobs", color: Color.red)
                            }
                        }.padding(5)
                    }
                    
                    Text("New Job")
                    NewJobWidget(employeesSO: employeesSO)
                    

                }
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
