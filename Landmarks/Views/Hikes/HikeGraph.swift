//
//  HikeGraph.swift
//  Landmarks
//
//  Created by 法伍 on 2024/2/28.
//

import SwiftUI

extension Animation {
    static func ripple(index: Int) -> Animation {
        .spring(dampingFraction: 0.5).speed(2).delay(0.03 * Double(index))
    }
}

struct HikeGraph: View {
    var hike: Hike

    var path: KeyPath<Hike.Observation, Range<Double>>

    var color: Color {
        switch path {
        case \.elevation:
            return Color(red: 255 / 255, green: 74 / 255, blue: 0 / 255)
        case \.heartRate:
            return Color(red: 255 / 255, green: 43 / 255, blue: 85 / 255)
        case \.pace:
            return Color(red: 255 / 255, green: 149 / 255, blue: 0 / 255)
        default:
            return .black
        }
    }

    var body: some View {
        let data = hike.observations
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path] })
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
        let heightRatio =
            1 - CGFloat(maxMagnitude / magnitude(of: overallRange))

        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                ForEach(Array(data.enumerated()), id: \.offset) {
                    index, observation in
                    GraphCapsule(
                        index: index,
                        color: color,
                        height: proxy.size.height,
                        range: observation[keyPath: path],
                        overallRange: overallRange
                    )
                    .animation(.ripple(index: index))
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}

func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}

func magnitude(of range: Range<Double>) -> Double {
    range.upperBound - range.lowerBound
}

#Preview {
    let hike = ModelData().hikes[0]
    return Group {
        HikeGraph(hike: hike, path: \.elevation)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.heartRate)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.pace)
            .frame(height: 200)
    }
}
