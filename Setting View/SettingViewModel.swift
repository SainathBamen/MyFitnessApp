//
//  SettingViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/06/25.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var firstSectionItems: [SettingsItem] = [
        SettingsItem(title: "Fitcoins", iconName: "flame", destination: "Fitcoins"),
        SettingsItem(title: "Leaderboard", iconName: "trophy", destination: "Leaderboard"),
        SettingsItem(title: "My Bookmarks", iconName: "bookmark", destination: "My Bookmarks"),
        SettingsItem(title: "My Orders", iconName: "cart", destination: "My Orders"),
        SettingsItem(title: "My Packages", iconName: "cube.box", destination: "My Packages")
    ]

    @Published var secondSectionItems: [SettingsItem] = [
        SettingsItem(title: "Help & Support", iconName: "questionmark.circle", destination: "Help & Support"),
        SettingsItem(title: "Learn", iconName: "doc.text", destination: "Learn"),
        SettingsItem(title: "Review", iconName: "star", destination: "Review"),
        SettingsItem(title: "Terms & Conditions", iconName: "doc.plaintext", destination: "Terms & Conditions"),
        SettingsItem(title: "Privacy Policy", iconName: "shield", destination: "Privacy Policy"),
        SettingsItem(title: "Community Guidelines", iconName: "checkmark.seal", destination: "Community Guidelines")
    ]

    let appVersion = "6.0.6 (1)"
}
