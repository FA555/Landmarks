//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by 法伍 on 2024/2/28.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData

    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username).bold().font(.title)
                Text(
                    "Notifications: \(profile.prefersNotifications ? "On": "Off" )"
                )
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)

                Divider()

                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)

                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }

                Divider()

                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)

                    if !modelData.hikes.isEmpty {
                        HikeView(hike: modelData.hikes[0])
                    } else {
                        Text("It's empty...")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 20)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default).environment(ModelData())
}
