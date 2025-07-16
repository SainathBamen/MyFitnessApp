//
//  WriteWorkout ViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 12/07/25.
//

import SwiftUI


class WriteWorkoutViewModel: ObservableObject {
    @Published var titleText: String = "📝 Write Your Today's Workout"
    @Published var subtitleText: String = "Stay consistent, stay fit!"
    @Published var gradientColors: [Color] = [.purple, .blue]

    func addWorkoutButtonTapped() {
        print("Workout button tapped – handle logic here.")
    }
}

