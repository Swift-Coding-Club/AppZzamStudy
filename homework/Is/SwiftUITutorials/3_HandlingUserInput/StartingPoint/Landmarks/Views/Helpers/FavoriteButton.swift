//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by sei on 2023/01/18.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct FavoriteButton: View {
    // binding property를 쓰면 얘의 변화가 Datasource 에도 전파된다
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            // Title Label은 .iconOnly라 안보이지만 Accessibility VoiceOver 때 이 label이 쓰인다.
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(false))
    }
}
