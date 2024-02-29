//
//  MapKit.swift
//  Landmarks
//
//  Created by 法伍 on 2024/2/27.
//

import MapKit
import SwiftUI

struct MapView: View {
    var coordinate: CLLocationCoordinate2D

    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium

    var delta: CLLocationDegrees {
        switch zoom {
        case .near:
            return 0.02
        case .medium:
            return 0.1
        case .far:
            return 1
        }
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: delta,
                longitudeDelta: delta
            )
        )
    }

    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"

        var id: Zoom {
            return self
        }
    }

    var body: some View {
        Map(position: .constant(.region(region)))
    }
}

#Preview {
    MapView(
        coordinate: CLLocationCoordinate2D(
            latitude: 34.011_286,
            longitude: 116.166_868
        ))
}
