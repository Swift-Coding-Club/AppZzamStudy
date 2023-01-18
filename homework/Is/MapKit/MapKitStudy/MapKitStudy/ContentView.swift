//
//  ContentView.swift
//  MapKitStudy
//
//  Created by sei on 2023/01/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
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
