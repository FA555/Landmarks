//
//  ContentView.swift
//  Landmarks
//
//  Created by 法伍 on 2024/2/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            // Text("Tab Content 1").tabItem {
            //     Text("Tab Label 1")
            // }.tag(1)
            // Text("Tab Content 2").tabItem {
            //     Text("Tab Label 2")
            // }.tag(2)

            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
