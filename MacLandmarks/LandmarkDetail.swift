//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by 法伍 on 2024/2/29.
//

import MapKit
import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData

    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { landmark.id == $0.id })!
    }

    var body: some View {
        @Bindable var modelData = modelData

        ScrollView {
            ZStack(
                alignment: Alignment(horizontal: .trailing, vertical: .top)
            ) {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)

                Button(String(localized: "Open in Maps")) {
                    let destination = MKMapItem(
                        placemark: MKPlacemark(
                            coordinate: landmark.locationCoordinate
                        ))

                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }

            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    // CircleImage(image: landmark.image)
                    //     .offset(y: -130)
                    //     .padding(.bottom, -130)
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)

                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            FavoriteButton(
                                isSet:
                                    $modelData
                                    .landmarks[landmarkIndex]
                                    .isFavorite
                            )
                            .buttonStyle(.plain)
                        }

                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                }

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
        .frame(width: 850, height: 700)
}
