//
//  Location.swift
//  YardSmart Location
//
//  Created by Felipe Galindo on 12/22/20.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct LocationOld: Identifiable, Codable, Equatable{
    var id: String
    var name: String
    var ownerID: String
    var clientType: String
    var address: String
    var propertyManagerName: String
    var lg: Bool
    var isActive: Bool
    var snowRemoval: Bool
    var lawnCare: Bool
    var scheduleLawnCare: String
    var priceLawnCareVisit: String
    var email: String
    var phone: String
    var notesLawnCare: String
    var salt: String
    var triggerSnowRemoval: String
    var billingStructureSnowRemoval: String
    var snowRemovalZeroToFive: String
    var snowRemovalFiveToTen: String
    var snowRemovalTenToFifthteen: String
    var snowRemovalFifthteenToTwenty: String
    var hourlyRateSnowRemoval: String
    var billingScheduleSnowRemoval: String
    var notesSnowRemoval: String
    var billHistory: [Bill]
    var messages: [Message]
    var avaliableActions: [Action]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: LocationOld, rhs: LocationOld) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}
struct Location: Identifiable, Codable{
    @DocumentID var id: String?
    var name: String
    var ownerID: String
    var clientType: String
    var address: String
    var propertyManagerName: String
    var lg: Bool
    var isActive: Bool
    var snowRemoval: Bool
    var lawnCare: Bool
    var scheduleLawnCare: String
    var priceLawnCareVisit: String
    var email: String
    var phone: String
    var notesLawnCare: String
    var salt: String
    var triggerSnowRemoval: String
    var billingStructureSnowRemoval: String
    var snowRemovalZeroToFive: String
    var snowRemovalFiveToTen: String
    var snowRemovalTenToFifthteen: String
    var snowRemovalFifthteenToTwenty: String
    var hourlyRateSnowRemoval: String
    var billingScheduleSnowRemoval: String
    var notesSnowRemoval: String
    var latitude: String
    var longitude: String
    var latitudeAcuracy: String
    var longitudeAcuracy: String
    var billHistory: [Bill]
    var messages: [Message]
    var avaliableActions: [Action]
}
// Code backup of old class
//class LocationViewModel: ObservableObject {
//    @Published var locationsDB : [Location] = []
//
//    func getLocations(){
//
//        // since were having only one set in firestore so were going to fetch that one only..
//        // you can add round 2,3... into firestore and can be fetched....
//
//        // change this to set.....
//        db.collection("Locations").getDocuments { (location, err) in
//
//            guard let data = location else{return}
//
//            DispatchQueue.main.async {
//                self.locationsDB = data.documents.compactMap({ (doc) -> Location? in
//                    return try? doc.data(as:Location.self)
//                })
//                //isUpdatingLocation = false
//            }
//
//        }
//    }
//}

class LocationViewModel: ObservableObject {
    @Published var locationsDB : [Location] = []
    func addLocation(location: Location){
        do {
            let _ = try db.collection("Locations").addDocument(from: location)
            
        }catch{
            print(error)
        }
        
    }
    
    func getLocations(){
        db.collection("Locations").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Document")
                return
            }
            self.locationsDB = documents.compactMap { (queryDocumentSnapshot) -> Location? in
                return try? queryDocumentSnapshot.data(as: Location.self)
                
            }
        }
            
    }
}







struct LocationOverview: View {
    @Binding var searchString: String
    var location : Location
    var body: some View {
        let matchesSearch = location.address.contains(searchString)
        if matchesSearch||searchString==""{
            ZStack{
                VStack{
                    ZStack(alignment: .leading){
                        Text(location.address).foregroundColor(Color.green).font(.largeTitle).fontWeight(.black)
                            .padding(5)
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.secondarySystemFill))
                    }
                    
                    ZStack{
                        ScrollView(.horizontal){
                            VStack{
                                HStack{
                                    Text("Manager:").foregroundColor(Color(UIColor.secondaryLabel))
                                    Text(location.propertyManagerName).foregroundColor(Color(UIColor.label))
                                    Spacer()
                                }
                                HStack{
                                    Text("Phone:").foregroundColor(Color(UIColor.secondaryLabel))
                                    Text(location.phone).foregroundColor(Color(UIColor.label))
                                    Text("Email:").foregroundColor(Color(UIColor.secondaryLabel))
                                    Text(location.email).foregroundColor(Color(UIColor.label))
                                }
                            }.padding(10)
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    
                    ZStack{
                        ScrollView(.horizontal){
                            HStack{
                                Text("Services:").font(.title)
                                if location.lawnCare{
                                  LawnCareLogo()
                                }
                                if location.snowRemoval{
                                  SnowRemovalLogo()
                                }
                                Spacer()
                            }.padding(5)
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                    
                    ZStack{
                        HStack {
                            Text("Client Type:").foregroundColor(Color(UIColor.secondaryLabel))
                            Text(location.clientType).foregroundColor(Color(UIColor.label))
                        }
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.tertiarySystemFill))
                    }
                }
                .padding(10)
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .fill(Color(UIColor.systemFill))
            }
        }
    }
}

struct LocationSnowRemoval: View {
    var location : Location
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(Color.blue.opacity(0.3))
            VStack{
                HStack{
                    SnowRemovalLogo().frame(minWidth: 5, idealWidth: 80, maxWidth: 120, minHeight: 20, idealHeight: 30, maxHeight:30, alignment: .center)
                    Spacer()
                }
                HStack{
                    Text("Salt:").foregroundColor(Color(UIColor.secondaryLabel))
                    Text(location.salt).foregroundColor(Color(UIColor.label))
                    Text("Snow Amount Trigger:").foregroundColor(Color(UIColor.secondaryLabel))
                    Text(location.triggerSnowRemoval).foregroundColor(Color(UIColor.label))
                }
                HStack{
                    Text("Schedule:").foregroundColor(Color(UIColor.secondaryLabel))
                    Text(location.billingScheduleSnowRemoval).foregroundColor(Color(UIColor.label))
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.systemFill))
                    VStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                .fill(Color(UIColor.secondarySystemFill))
                            HStack{
                                Text("Billing Kind:").foregroundColor(Color(UIColor.secondaryLabel))
                                Text(location.billingStructureSnowRemoval).foregroundColor(Color(UIColor.label))
                                Text("Hourly Rate:").foregroundColor(Color(UIColor.secondaryLabel))
                                Text(location.hourlyRateSnowRemoval).foregroundColor(Color(UIColor.label))
                            }
                            .padding(5)
                            
                        }
                        HStack{
                            VStack{
                                Text(location.snowRemovalZeroToFive).foregroundColor(Color(UIColor.label))
                                Text("0-5 In").foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            VStack{
                                Text(location.snowRemovalFiveToTen).foregroundColor(Color(UIColor.label))
                                Text("5-10 In").foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            VStack{
                                Text(location.snowRemovalTenToFifthteen).foregroundColor(Color(UIColor.label))
                                Text("10-15 In").foregroundColor(Color(UIColor.secondaryLabel))
                            }
                            VStack{
                                Text(location.snowRemovalFifthteenToTwenty).foregroundColor(Color(UIColor.label))
                                Text("15-20 In").foregroundColor(Color(UIColor.secondaryLabel))
                            }
                        }
                    }
                    .padding(5)
                }
            }.padding(5)
        }
    }
}

struct LocationEditor: View {
    @Binding var location : Location
    var body: some View {
        ScrollView{
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(Color(UIColor.systemFill))
                        VStack{
                            ZStack(alignment: .leading){
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.secondarySystemFill))
                                TextEditor(text: $location.address)
                                    .padding(5)
                            }
                            
                            ZStack{
                                ScrollView(.horizontal){
                                    VStack{
                                        HStack{
                                            Text("Manager:").foregroundColor(Color(UIColor.secondaryLabel))
                                            Text(location.propertyManagerName).foregroundColor(Color(UIColor.label))
                                            Spacer()
                                        }
                                        HStack{
                                            Text("Phone:").foregroundColor(Color(UIColor.secondaryLabel))
                                            Text(location.phone).foregroundColor(Color(UIColor.label))
                                            Text("Email:").foregroundColor(Color(UIColor.secondaryLabel))
                                            Text(location.email).foregroundColor(Color(UIColor.label))
                                        }
                                    }.padding(10)
                                }
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.tertiarySystemFill))
                            }
                            
                            ZStack{
                                VStack{
                                    Text("Services:")
                                    if location.lawnCare{
                                        ZStack{
                                            VStack{
                                                HStack{
                                                    LawnCareLogo()
                                                    Spacer()
                                                }
                                                HStack{
                                                    Text("Schedule:").foregroundColor(Color(UIColor.secondaryLabel))
                                                    Text(location.scheduleLawnCare).foregroundColor(Color(UIColor.label))
                                                    Text("Price Per Visit:").foregroundColor(Color(UIColor.secondaryLabel))
                                                    Text(location.priceLawnCareVisit).foregroundColor(Color(UIColor.label))
                                                }
                                            }.padding(5)
                                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                                .fill(Color.green.opacity(0.3))
                                        }
                                      
                                    }
                                    if location.snowRemoval{
                                        LocationSnowRemoval(location: location)
                                            .padding(5)
                                            .frame(minWidth: 50, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 180, idealHeight: 180, maxHeight: 250, alignment: .center)
                                    }
                                }.padding(5)
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.tertiarySystemFill))
                            }
                            
                            ZStack{
                                HStack {
                                    Text("Client Type:").foregroundColor(Color(UIColor.secondaryLabel))
                                    Text(location.clientType).foregroundColor(Color(UIColor.label))
                                }
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.tertiarySystemFill))
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.secondarySystemFill))
                                VStack{
                                    Text("Notes Lawn Care:").foregroundColor(Color(UIColor.secondaryLabel))
                                    Text(location.notesLawnCare).foregroundColor(Color(UIColor.label))

                                }
                                .padding(5)
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.secondarySystemFill))
                                VStack{
                                    Text("Notes Snow Removal:").foregroundColor(Color(UIColor.secondaryLabel))
                                    Text(location.notesLawnCare).foregroundColor(Color(UIColor.label))

                                }
                                .padding(5)
                            }
                        }
                        .padding(10)
                    }
                
            }
        }
    }
}

struct LocationViewer: View {
    var location : Location
    var body: some View {
        ScrollView{
            VStack{
                ZStack{
                        VStack{
                            ZStack(alignment: .leading){
                                Text(location.address).foregroundColor(Color.green).font(.largeTitle).fontWeight(.black)
                                    .padding(5)
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.secondarySystemFill))
                            }
                            
                            ZStack{
                                ScrollView(.horizontal){
                                    VStack{
                                        HStack{
                                            Text("Manager:").foregroundColor(Color(UIColor.secondaryLabel))
                                            Text(location.propertyManagerName).foregroundColor(Color(UIColor.label))
                                            Spacer()
                                        }
                                        HStack{
                                            Text("Phone:").foregroundColor(Color(UIColor.secondaryLabel))
                                            Text(location.phone).foregroundColor(Color(UIColor.label))
                                            Text("Email:").foregroundColor(Color(UIColor.secondaryLabel))
                                            Text(location.email).foregroundColor(Color(UIColor.label))
                                        }
                                    }.padding(10)
                                }
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.tertiarySystemFill))
                            }
                            
                            ZStack{
                                VStack{
                                    Text("Services:")
                                    if location.lawnCare{
                                        ZStack{
                                            VStack{
                                                HStack{
                                                    LawnCareLogo()
                                                    Spacer()
                                                }
                                                HStack{
                                                    Text("Schedule:").foregroundColor(Color(UIColor.secondaryLabel))
                                                    Text(location.scheduleLawnCare).foregroundColor(Color(UIColor.label))
                                                    Text("Price Per Visit:").foregroundColor(Color(UIColor.secondaryLabel))
                                                    Text(location.priceLawnCareVisit).foregroundColor(Color(UIColor.label))
                                                }
                                            }.padding(5)
                                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                                .fill(Color.green.opacity(0.3))
                                        }
                                      
                                    }
                                    if location.snowRemoval{
                                        LocationSnowRemoval(location: location)
                                            .padding(5)
                                            .frame(minWidth: 50, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 180, idealHeight: 180, maxHeight: 250, alignment: .center)
                                    }
                                }.padding(5)
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.tertiarySystemFill))
                            }
                            
                            ZStack{
                                HStack {
                                    Text("Client Type:").foregroundColor(Color(UIColor.secondaryLabel))
                                    Text(location.clientType).foregroundColor(Color(UIColor.label))
                                }
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.tertiarySystemFill))
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.secondarySystemFill))
                                VStack{
                                    Text("Notes Lawn Care:").foregroundColor(Color(UIColor.secondaryLabel))
                                    Text(location.notesLawnCare).foregroundColor(Color(UIColor.label))

                                }
                                .padding(5)
                            }
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .circular)
                                    .fill(Color(UIColor.secondarySystemFill))
                                VStack{
                                    Text("Notes Snow Removal:").foregroundColor(Color(UIColor.secondaryLabel))
                                    Text(location.notesLawnCare).foregroundColor(Color(UIColor.label))

                                }
                                .padding(5)
                            }
                        }
                        .padding(10)
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(Color(UIColor.systemFill))
                    }
                
            }
        }
    }
}
struct LocationsViewer: View {
    @Binding var search_string: String
    @State private var isExpanded: Bool =  false
    var locations: [Location]
    var body: some View {
        ZStack{
//            RoundedRectangle(cornerRadius: 10, style: .circular)
//                .fill(Color(UIColor.systemFill))
            
            LazyVStack{
                Text("There are \(locations.count) Locations in the database:")
                
                Rectangle()
                    .fill(Color(UIColor.systemFill))
                .frame(minWidth: 180, idealWidth: ScreenW, maxWidth: ScreenW, minHeight: 40, idealHeight: 60, maxHeight: 100, alignment: .center)
                    .cornerRadius(50)
                .overlay(
                    VStack{
                        TextField("Type Address", text: $search_string)
                            .font(.system(size: 40, weight: .black, design: .default))
                            .onChange(of: search_string) { newValue in
                                if self.search_string != ""{
                                    self.isExpanded = true
                                }else{
                                    self.isExpanded = false
                                }
                            }

                    }.padding(15)
                )
                DisclosureGroup("Results will show up here after you start typing the address, or Click the blue triangle to show all entries", isExpanded: $isExpanded) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                .fill(Color(UIColor.systemFill))
                            VStack{
                                ForEach(0 ..< locations.count,id: \.self){num in
                                    NavigationLink(destination: LocationViewer(location: locations[num])) {
                                        LocationOverview(searchString: $search_string, location: locations[num])
                                                .background(Color(UIColor.systemBackground).opacity(0.7))
                                                .cornerRadius(15)
                                    }
                                    .padding(5)
                                }
                            }
                        }
                }
            }
            .padding(5)

        }
    }
}



struct LocationsList: View {
    @State var searchString = ""
    @ObservedObject public var locationsSO = LocationViewModel()
    var body: some View{
            ScrollView{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemFill))
                    VStack{
                        LocationsViewer(search_string: $searchString, locations: locationsSO.locationsDB).onAppear(){
                            locationsSO.getLocations()
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
        }
    }
}

struct submitJSON: View {
    var body: some View{
        VStack{
            Spacer()
            Button(action: {
                for location in LocationMasterListNew{
                    do {
                        let _ = try db.collection("Locations").addDocument(from: location)
                    }
                    catch{
                        print(error)
                    }
                    
                }
            }, label: {
                smallButton(text: "Submit Data", color: Color.red)
            })
            
        }
    }
}


struct LocationsListJSON: View {
    @State var searchString = ""
    var body: some View{
            ScrollView{
                NavigationLink(
                    destination: submitJSON(),
                    label: {
                        smallButton(text: "Submit To Firestore", color: Color.yellow)
                    })
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemFill))
                    LocationsViewer(search_string: $searchString, locations: LocationMasterListNew)
                    .padding(5)
                }
        }
    }
}
