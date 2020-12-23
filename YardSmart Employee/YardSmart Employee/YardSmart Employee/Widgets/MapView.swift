//
//  MapView.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/16/20.
//

import SwiftUI
import MapKit
import CoreLocation
//
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    @Published var region = MKCoordinateRegion()
//    private let manager = CLLocationManager()
//    override init() {
//        super.init()
//        manager.delegate = self
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
//        print("accuracy allowed is ")
//        print(manager.accuracyAuthorization)
//    }
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        locations.last.map {
//            let center = CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)
//            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
//            region = MKCoordinateRegion(center: center, span: span)
//        }
//    }
//}

//struct MapView: View {
//    //@State private var userTrackingMode: MapUserTrackingMode = .follow
//    //@StateObject private var manager = LocationManager()
//
//    var body: some View {
//        Map(coordinateRegion: $manager.region,
//            interactionModes: MapInteractionModes.all,
//            showsUserLocation: true,
//            userTrackingMode: $userTrackingMode)
//    }
//}

//struct MapView: UIViewRepresentable {
//
//  var locationManager = CLLocationManager()
//  func setupManager() {
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest
//    locationManager.requestWhenInUseAuthorization()
//    locationManager.requestAlwaysAuthorization()
//  }
//
//  func makeUIView(context: Context) -> MKMapView {
//    setupManager()
//    let mapView = MKMapView(frame: UIScreen.main.bounds)
//    mapView.showsUserLocation = true
//    mapView.userTrackingMode = .follow
//    return mapView
//  }
//
//  func updateUIView(_ uiView: MKMapView, context: Context) {
//  }
//}


var locationManager = CLLocationManager()

struct MapView: UIViewRepresentable {
    


  func setupManager() {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestAlwaysAuthorization()
  }
  
  func makeUIView(context: Context) -> MKMapView {
    setupManager()
    let mapView = MKMapView(frame: UIScreen.main.bounds)
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    return mapView
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
  }
}


struct locationInfoWidget: View {

    var userLatitude: String {
        return "\(locationManager.location?.coordinate.latitude ?? 0)"

    }

    var userLongitude: String {
        return "\(locationManager.location?.coordinate.longitude ?? 0)"
    }
   var address_string: String = "No address"
    
//    func address(){
//        return CLGeocoder.init().reverseGeocodeLocation(locationManager.location!) { (place, error) in
//            self.address_string = place?.first?.country
//
//        }
//    }
//
    let loc = locationManager.location
    



    var body: some View {
        VStack {
            HStack {
                Text("location access: \(locationManager.accuracyAuthorization.rawValue)")
                Spacer()
                Text("VA: \((locationManager.location?.verticalAccuracy.description)!)")
                Text("HA: \((locationManager.location?.horizontalAccuracy.description)! ?? "notfound")")
            }
            HStack {
                Text("latitude: \(userLatitude)")
                Text("longitude: \(userLongitude)")
            }
            Text("add: \(address_string)")
        }.font(.system(size: 8, weight: .black, design: .default))
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
        locationInfoWidget()
    }
}
