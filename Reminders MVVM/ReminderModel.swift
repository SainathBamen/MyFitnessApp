//
//  File.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//

import SwiftUI

struct Reminder: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var date: Date
}
