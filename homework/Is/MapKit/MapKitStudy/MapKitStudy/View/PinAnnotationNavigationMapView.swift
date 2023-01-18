//
//  PinAnnotationNavigationMapView.swift
//  MapKitStudy
//
//  Created by sei on 2023/01/18.
//

import SwiftUI
import MapKit

struct PinAnnotationNavigationMapView: View {
    let cafes: [Cafe]
    @StateObject private var manager = LocationManager()

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                Map(coordinateRegion: $manager.region,
                    annotationItems:cafes) { cafe in
                    MapAnnotation(coordinate: cafe.locationCoordinate) {
                        NavigationLink {
                            CafeDetail(cafe: cafe)
                        } label: {
                            Image(systemName: "cup.and.saucer.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.brown)
                                .frame(width:40)
                        }
                    }
                }
                    .ignoresSafeArea()
            }
        }
        .navigationTitle("Cafes")
    }
}

struct MapPinAnnotationNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        PinAnnotationNavigationMapView(cafes:ModelData().cafes)
    }
}
