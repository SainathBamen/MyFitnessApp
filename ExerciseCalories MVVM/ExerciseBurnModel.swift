//
//  ExerciseBurnModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 16/07/25.
//

import SwiftUI

struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let caloriesPerHour: Int
    let description: String
    let image: String
}

