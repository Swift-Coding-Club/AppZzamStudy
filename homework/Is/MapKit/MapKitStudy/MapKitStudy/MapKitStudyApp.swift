//
//  MapKitStudyApp.swift
//  MapKitStudy
//
//  Created by sei on 2023/01/18.
//

import SwiftUI

@main
struct MapKitStudyApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
