//
//  ContentView.swift
//  MacLandmarks
//
//  Created by 法伍 on 2024/2/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView().environment(ModelData())
}
