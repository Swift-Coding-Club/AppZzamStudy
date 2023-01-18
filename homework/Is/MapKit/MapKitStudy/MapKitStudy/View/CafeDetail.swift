//
//  CafeDetail.swift
//  MapKitStudy
//
//  Created by sei on 2023/01/18.
//

import SwiftUI

struct CafeDetail: View {
    let cafe: Cafe

    var body: some View {
        VStack(alignment: .leading) {
            Text(cafe.name)
                .font(.title)
            Text(cafe.openingInfo)
                .padding(.bottom)
            Text(cafe.address)
                .font(.subheadline)
            Text(cafe.description)
                .padding(.top)
        }
        .padding()
        .navigationTitle(cafe.name)
    }
}

struct CafeDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        CafeDetail(cafe: modelData.cafes[0])
    }
}
