//
//  ContentView.swift
//  MapKitStudy
//
//  Created by sei on 2023/01/18.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        VStack {
            PinAnnotationMapView(cafes: modelData.cafes)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
