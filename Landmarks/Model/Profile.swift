//
//  Profile.swift
//  Landmarks
//
//  Created by 法伍 on 2024/2/28.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    static let `default` = Profile(username: "fa_555")

    enum Season: String, CaseIterable, Identifiable {
        var id: String { rawValue }

        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}
