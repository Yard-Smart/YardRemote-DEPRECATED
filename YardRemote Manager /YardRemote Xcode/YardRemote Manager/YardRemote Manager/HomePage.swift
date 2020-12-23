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
    var body: some View {
        VStack {
            Rectangle()
            .frame(width: TopW, height: TopH-50).edgesIgnoringSafeArea(.all)
            NavigationView {
                List() {
                    Section(header:
                        HStack {
                            Spacer()
                            Text("Past Jobs")
                                .font(.system(size: 26, weight: .black, design: .default))
                    }) {
                        PastJobsWidget()
                    }
                    
                    Section(header:
                        HStack {
                            Spacer()
                            Text("New Job")
                                .font(.system(size: 26, weight: .black, design: .default))
                    }) {
                        NewJobWidget()
                        
                    }
                    
                    Section(header:
                        HStack {
                            Spacer()
                            Text("Management")
                                .font(.system(size: 26, weight: .black, design: .default))
                    }) {
                        managementWidget()
                    }
                    
                }
                .listStyle(GroupedListStyle())
                .navigationBarHidden(true)
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .overlay(VStack {
            LandingPageTop().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
        })
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
