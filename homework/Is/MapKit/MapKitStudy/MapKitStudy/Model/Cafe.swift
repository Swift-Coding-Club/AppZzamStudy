//
//  Cafe.swift
//  MapKitStudy
//
//  Created by sei on 2023/01/18.
//

import Foundation
import CoreLocation

struct Cafe: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var address: String
    var openingInfo: String
    var description: String
    var isFavorite: Bool

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
