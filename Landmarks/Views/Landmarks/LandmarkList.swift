//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 法伍 on 2024/2/27.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData

    @State private var showFavoritesOnly = false

    @State private var filter = FilterCategory.all

    @State private var selectedLandmark: Landmark?

    var selectedIndex: Int? {
        modelData.landmarks.firstIndex(
            where: { $0.id == selectedLandmark?.id }
        )
    }

    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
                && (filter == .all
                    || filter.rawValue == landmark.category.rawValue)
        }
    }

    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }

    var body: some View {
        @Bindable var modelData = modelData

        NavigationSplitView {
            List(selection: $selectedLandmark) {
                // Toggle(isOn: $showFavoritesOnly) {
                //     Text("Favorites only")
                // }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(title)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        // .pickerStyle(.inline)
                        .pickerStyle(.menu)

                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
        .focusedValue(
            \.selectedLandmark,
            $modelData.landmarks[selectedIndex ?? 0]
        )
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
