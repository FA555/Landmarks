//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by 法伍 on 2024/2/29.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .task {
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
            .task {
                print("Started.")
            }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
