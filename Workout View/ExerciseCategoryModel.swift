//
//  ExerciseCategoryModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 09/07/25.
//

import SwiftUI

struct ExerciseCategory: Identifiable {
    let id = UUID()
    let title: String
    let exercises: [String]
}
