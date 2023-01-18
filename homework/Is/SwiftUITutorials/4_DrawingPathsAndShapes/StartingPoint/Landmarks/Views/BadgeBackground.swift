//
//  BadgeBackground.swift
//  Landmarks
//
//  Created by sei on 2023/01/18.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI
// https://developer.apple.com/tutorials/swiftui/drawing-paths-and-shapes#Create-Drawing-Data-for-a-Badge-View
struct BadgeBackground: View {
    var body: some View {
        Path { path in
            var width: CGFloat = 100.0
            let height = width
            path.move(
                to: CGPoint(
                    x: width * 0.95,
                    y: height * 0.20
                )
            )
        }
        .fill(.black)
    }
}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
