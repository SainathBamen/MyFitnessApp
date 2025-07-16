//
//  WorkOutViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 12/04/25.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var workouts = [
        WorkOutModel(name: "Chest", description: "A basic upper body exercise.", imageName: "chestImg"),
        WorkOutModel(name: "Shoulder", description: "An upper body exercise.", imageName: "shoulderImg"),
        WorkOutModel(name: "Triceps", description: "Tricep", imageName: "tricepImg"),
        WorkOutModel(name: "Biceps", description: "Bicep", imageName: "bicepImg"),
        WorkOutModel(name: "Back", description: "Back", imageName: "backImg"),
        WorkOutModel(name: "Abs", description: "Abs", imageName: "absImg"),
        WorkOutModel(name: "Legs", description: "Legs", imageName: "legImg"),
        WorkOutModel(name: "Other", description: "", imageName: "Other")
    ]
}
