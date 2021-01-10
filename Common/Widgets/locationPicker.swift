//
//  locationPicker.swift
//  YardSmart Employee
//
//  Created by Felipe Galindo on 12/23/20.
//

import SwiftUI
import FirebaseFirestore

//struct locationOverview: View {
//    var location: Location
//    var body: some View {
//        Text("nope")
//    }
//}

struct locationPicker: View {
    @ObservedObject public var locationsSO = LocationViewModel()
    @Binding var locationID: String
    @State var searchString: String = ""
    @State var locationAddress: String = ""
    @State private var isConfirmed: Bool = false
    @State private var isExpanded = false
    var body: some View {
        Rectangle()
        .fill(Color(UIColor.systemFill))
        .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 10, idealHeight: 10, maxHeight: 40, alignment: .center)
        .cornerRadius(30)
        .overlay(
            HStack{
                TextField("Type Address", text: $searchString)
                    .foregroundColor(locationAddress==searchString ? Color.green :  Color.blue)
                    .font(.system(size: 40, weight: .black, design: .default))
                    .onChange(of: searchString) { newValue in
                        if self.searchString != ""{
                            self.isExpanded = true
                        }else{
                            self.isExpanded = false
                        }
                        if isConfirmed {
                            isConfirmed = false
                        }
                    }
                    .padding(15)
            }
            
        )
        if searchString=="" {
            ZStack{
                MapView()
                    .frame(minWidth: 100, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 100, idealHeight: ScreenW, maxHeight: ScreenW, alignment: .center)
                    .cornerRadius(10)
                    .onTapGesture {

                    }
                if locationManager.accuracyAuthorization.rawValue != 0{Text("Map Functionality Unavaliable, talk to developer.")}
            }
        }else{
            if !(locationAddress==searchString) {
                ScrollView{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.systemFill))
                        VStack{
    //                        LocationsViewer(locations: locationsSO.locationsDB).onAppear(){
    //                            locationsSO.getLocations()
    //                        }
                            ZStack{
                    //            RoundedRectangle(cornerRadius: 10, style: .circular)
                    //                .fill(Color(UIColor.systemFill))
                                DisclosureGroup("Results will show up here after you start typing the address, or Click the blue triangle to show all entries", isExpanded: $isExpanded) {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10, style: .circular)
                                            .fill(Color(UIColor.systemFill))
                                        VStack{
                                            ForEach(0 ..< LocationMasterListNew.count,id: \.self){num in
                                                Button(action: {
                                                    locationID = LocationMasterListNew[num].id ?? "NO ID"
                                                    searchString = LocationMasterListNew[num].address
                                                    locationAddress = LocationMasterListNew[num].address
                                                    isConfirmed = true  //IMPORTANT
                                                }, label: {
                                                    LocationOverview(searchString: $searchString, location: LocationMasterListNew[num])
                                                            .background(Color(UIColor.systemBackground).opacity(0.7))
                                                            .cornerRadius(15)
                                                            .padding(5)
                                                })
                                            }
                                        }
                                    }.padding(5)
                                }
                            }
                            
                            Button(action: {
                                isUpdating = true
                                locationsSO.getLocations()
                            }, label: {
                                refreshButton(isUpdating: isUpdating)
                            })
                        }
                        .padding(5)
                    }
                }.frame(width: ScreenW, height: ScreenH, alignment: .center)
            }
        }
        locationInfoWidget()
    }
}

