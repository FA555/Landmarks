//
//  PageView.swift
//  Landmarks
//
//  Created by 法伍 on 2024/2/28.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]

    @State private var currentPage = 0

    var body: some View {
        // VStack {
        //     PageViewController(pages: pages, currentPage: $currentPage)
        //     Text("Current Page: \(currentPage)")
        // }

        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count) * 18)
                .padding(.trailing)
                .padding(.bottom, 10)
        }
        .aspectRatio(1.5, contentMode: .fit)
    }
}

#Preview {
    PageView(
        pages: ModelData().features.map { landmark in
            FeatureCard(landmark: landmark)
        })
}
