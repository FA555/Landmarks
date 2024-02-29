//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 法伍 on 2024/2/27.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 5))

            #if os(watchOS)
            Text(landmark.name)
            #else
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .bold()
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            #endif

            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

// #Preview("Turtle Rock") {
//     LandmarkRow(landmark: landmarks[0])
// }

// #Preview("Salmon") {
//     LandmarkRow(landmark: landmarks[1])
// }

#Preview {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
