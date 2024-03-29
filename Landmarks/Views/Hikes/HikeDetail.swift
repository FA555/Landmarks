//
//  HikeDetail.swift
//  Landmarks
//
//  Created by 法伍 on 2024/2/28.
//

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation

    let buttons = {
        [
            ("Elevation", \Hike.Observation.elevation),
            ("Heart Rate", \Hike.Observation.heartRate),
            ("Pace", \Hike.Observation.pace),
        ].map { (String(localized: $0.0), $0.1) }
    }()

    var body: some View {
        VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)

            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button {
                        dataToShow = value.1
                    } label: {
                        Text(value.0)
                            .font(.system(size: 16))
                            .foregroundStyle(
                                value.1 == dataToShow ? .gray : .accentColor
                            )
                            .animation(nil)
                    }
                }
            }
        }
    }
}

#Preview {
    HikeDetail(hike: ModelData().hikes[0])
}
