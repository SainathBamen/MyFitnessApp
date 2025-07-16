//
//  GoalCalculatorModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 02/07/25.
//


import SwiftUI

class GoalCalculatorViewModel: ObservableObject {
    @Published var currentWeight: String = ""
    @Published var targetWeight: String = ""
    @Published var durationInDays: String = ""
    @Published var dailyCalories: Double?

    func calculateCalories() {
        guard let current = Double(currentWeight),
              let target = Double(targetWeight),
              let days = Double(durationInDays),
              current > target,
              days > 0 else {
            dailyCalories = nil
            return
        }

        let weightLoss = current - target
        let totalCalories = weightLoss * 7700
        dailyCalories = totalCalories / days
    }
}


