//
//  IdenfiablePlace.swift
//  MapKitStudy
//
//  Created by sei on 2023/01/18.
//

import Foundation
import CoreLocation

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}
