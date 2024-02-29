//
//  HikeBadge.swift
//  Landmarks
//
//  Created by 法伍 on 2024/2/28.
//

import SwiftUI

struct HikeBadge: View {
    var name: String

    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1 / 3)
                .frame(width: 100, height: 100)

            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name)")
        }
    }
}

#Preview {
    HikeBadge(name: "Preview Testing")
}
