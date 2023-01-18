//
//  MapView.swift
//  MapKitStudy
//
//  Created by sei on 2023/01/18.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var manager = LocationManager()

    var body: some View {
        Map(coordinateRegion: $manager.region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(LocationManager())
    }
}
