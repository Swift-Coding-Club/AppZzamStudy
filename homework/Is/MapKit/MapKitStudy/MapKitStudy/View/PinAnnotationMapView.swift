//
//  SwiftUIView.swift
//  MapKitStudy
//
//  Created by sei on 2023/01/18.
//

import SwiftUI
import MapKit

struct PinAnnotationMapView: View {
    let cafes: [Cafe]
    @StateObject private var manager = LocationManager()

    var body: some View {
        Map(coordinateRegion: $manager.region,
            annotationItems:cafes)
        { cafe in
            MapMarker(coordinate: cafe.locationCoordinate,
                      tint: Color.purple)
        }
    }
}

struct PinAnnotationMapView_Previews: PreviewProvider {
    static var previews: some View {
        PinAnnotationMapView(cafes: ModelData().cafes)
    }
}
