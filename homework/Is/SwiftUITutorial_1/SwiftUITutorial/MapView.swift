//
//  MapView.swift
//  SwiftUITutorial
//
//  Created by sei on 2023/01/17.
//

import SwiftUI
import MapKit

struct MapView: View {
    // State property wrapper를 붙여서
    // region이 바뀌면 이걸 보는 다른 view들이 자동으로 업뎃되는 느낌인듯
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )

    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
