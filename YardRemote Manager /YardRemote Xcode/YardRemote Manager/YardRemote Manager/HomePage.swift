//
//  HomePage.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/16/20.
//

import SwiftUI
import Combine
import CoreLocation

var TopH:CGFloat = 80
var TopW:CGFloat = UIScreen.main.bounds.width




struct PastJobsWidget: View {
    @State private var search_string: String = ""
    @State private var isExpanded: Bool =  false
    
    var body: some View{
        Rectangle()
            .fill(Color(UIColor.systemFill))
        .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 60, idealHeight: 10, maxHeight: 100, alignment: .center)
            .cornerRadius(50)
        .overlay(
            VStack{
                TextField("Type Address", text: $search_string)
                    .font(.system(size: 40, weight: .black, design: .default))
                    .onChange(of: search_string) { newValue in
                        print("Searching for Job: \(search_string)!")
                        if self.search_string != ""{
                            self.isExpanded = true
                        }else{
                            self.isExpanded = false
                        }
                    }

            }.padding(15)
        )
        DisclosureGroup("", isExpanded: $isExpanded) {
            ScrollView(.horizontal){
                Rectangle()
                    .fill(Color(UIColor.systemFill))
                .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .center)
            }
        }
    }
}

struct startBotton : View {
    var body: some View {
        Rectangle()
        .fill(Color.green)
        .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 100, idealHeight: 100, maxHeight: 200, alignment: .center)
        .cornerRadius(10)
        .overlay(
            VStack{
                HStack {
                    Text("START")
                        .foregroundColor(Color(UIColor.label))
                        .font(.system(size: 80, weight: .black, design: .default))

                }
                    
            }.padding(5)
            
        )
    }
}

func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?)
                -> Void ) {
    // Use the last reported location.
    if let lastLocation = locationManager.location {
        let geocoder = CLGeocoder()
            
        // Look up the location and pass it to the completion handler
        geocoder.reverseGeocodeLocation(lastLocation,
                    completionHandler: { (placemarks, error) in
            if error == nil {
                let firstLocation = placemarks?[0]
                completionHandler(firstLocation)
            }
            else {
             // An error occurred during geocoding.
                completionHandler(nil)
            }
        })
    }
    else {
        // No location was available.
        completionHandler(nil)
    }
}


struct NewJobWidget: View {
    @State private var mapWidth: CGFloat = 400
    @State private var n_employees = 5.0
    @State private var address = lookUpCurrentLocation(completionHandler: locationManager.delegate)
    @State private var isEditing = false
    var body: some View {
        VStack{
            MapView()
                .frame(minWidth: 100, idealWidth: TopW, maxWidth: TopW, minHeight: 100, idealHeight: mapWidth, maxHeight: 500, alignment: .center)
                .cornerRadius(10)
                .onTapGesture {
                    self.mapWidth = 400
                }
            locationInfoWidget()
            Rectangle()
            .fill(Color(UIColor.systemFill))
            .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 10, idealHeight: 10, maxHeight: 80, alignment: .center)
            .cornerRadius(10)
            .overlay(
                VStack{
                        Slider(
                            value: $n_employees,
                            in: 0...5,
                            step: 1,
                            onEditingChanged: { editing in
                                isEditing = editing
                            },
                            minimumValueLabel: Text("0"),
                            maximumValueLabel: Text("5")
                        ) {
                        }
                    Text("Will mark as using \(Int(n_employees)) employees")
                            .foregroundColor(isEditing ? .red : .blue)
                    
                    HStack {
                        
                            

                    }
                    .foregroundColor(Color(UIColor.label))
                    
                    .font(.system(size: 18, weight: .black, design: .default))
                        
                }.padding(5)
                
            )
            
            Rectangle()
            .fill(Color(UIColor.systemFill))
            .frame(minWidth: 180, idealWidth: TopW, maxWidth: TopW, minHeight: 10, idealHeight: 10, maxHeight: 40, alignment: .center)
            .cornerRadius(30)
            .overlay(
                HStack{
                    TextField("Type Address", text: $address)
                        .font(.system(size: 40, weight: .black, design: .default))
                        .padding(15)
                        

                        
                }
                
            )
            
            startBotton()
            
            
//            VStack {
//                  Text("Your location is:")
//                  HStack {
//                    Text("Latitude: \(locationViewModel.userLatitude)")
//                    Text("Longitude: \(locationViewModel.userLongitude)")
//                  }
//            }
        }
    }
}


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
