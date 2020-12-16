//
//  locationManagerDidChangeAuthorization.swift
//  YardRemote Manager
//
//  Created by Felipe Galindo on 12/16/20.
//

import Foundation
import CoreLocation

func locationManagerDidChangeAuthorization(manager: CLLocationManager) {
    let accuracyAuthorization = manager.accuracyAuthorization
    switch accuracyAuthorization {
    case .fullAccuracy:
        break
    case .reducedAccuracy:
        manager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "ForDelivery")
        break
    default:
        break
    }
}
