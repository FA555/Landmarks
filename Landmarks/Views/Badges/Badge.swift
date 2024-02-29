//
//  Badge.swift
//  Landmarks
//
//  Created by 法伍 on 2024/2/27.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        // RotatedBadgeSymbol(angle: Angle(degrees: 0)).opacity(0.5)
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(angle: .degrees(Double(index) / 8) * 360)
        }
        .opacity(0.5)
    }

    var body: some View {
        ZStack {
            BadgeBackground()

            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1 / 4, anchor: .top)
                    .position(
                        x: geometry.size.width / 2,
                        y: geometry.size.height * (3 / 4))
            }
        }
        .scaledToFit()
    }
}

#Preview {
    Badge()
}
