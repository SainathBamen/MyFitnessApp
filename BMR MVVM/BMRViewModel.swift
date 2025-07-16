//
//  BMRViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 14/04/25.
//



import SwiftUI

class BMRViewModel: ObservableObject {
    @Published var weight = ""
    @Published var height = ""
    @Published var age = ""
    @Published var gender = "Male"
    @Published var selectedActivity = 0
    @Published var bmr: Double?
    @Published var calories: Double?

    //For Segment Selection.
    let genders = ["Male", "Female"]
    
    let activities: [Activity] = [
        Activity(description: "💤 Sedentary (no exercise)", factor: 1.2),
        Activity(description: "🚶 Lightly active (1–3 days)", factor: 1.375),
        Activity(description: "🏃 Moderately active (3–5 days)", factor: 1.55),
        Activity(description: "🏋️ Very active (6–7 days)", factor: 1.725),
        Activity(description: "🔥 Super active (hard job/workout)", factor: 1.9)
    ]
    
    // MARK: - BMR Calculation.
    func calculateBMR() {
        guard let w = Double(weight),
              let h = Double(height),
              let a = Double(age) else {
            bmr = nil
            calories = nil
            return
        }

        let baseBMR: Double = gender == "Male"
            ? (10 * w + 6.25 * h - 5 * a + 5)
            : (10 * w + 6.25 * h - 5 * a - 161)

        bmr = baseBMR
        calories = baseBMR * activities[selectedActivity].factor
    }
    
    // MARK: - Resets all input and output values.
       func resetValues() {
           weight = ""
           height = ""
           age = ""
           selectedActivity = 0
           bmr = nil
           calories = nil
       }
}
