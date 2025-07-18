//
//  BodyFatViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 8/07/25.
//

import SwiftUI

class BodyFatViewModel: ObservableObject {
    @Published var age: String = ""
    @Published var gender: String = "Male"
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var waist: String = ""
    @Published var bodyFat: Double?
    @Published var showAlert: Bool = false

    let genders = ["Male", "Female"]

    func calculateBodyFat() {
        guard let age = Double(age),
              let weight = Double(weight),
              let height = Double(height),
              let waist = Double(waist) else {
            showAlert = true
            return
        }

        let input = BodyFatInput(age: age, weight: weight, height: height, waist: waist, gender: gender)

        var fatPercentage: Double = 0.0

        if input.gender == "Male" {
            fatPercentage = (1.20 * (input.weight / pow(input.height / 100, 2))) + (0.23 * input.age) - (10.8 * 1) - 5.4
        } else {
            fatPercentage = (1.20 * (input.weight / pow(input.height / 100, 2))) + (0.23 * input.age) - (10.8 * 0) - 5.4
        }

        withAnimation {
            self.bodyFat = fatPercentage
        }
    }

    func fatColor(for fat: Double) -> Color {
        switch fat {
        case ..<18: return .green
        case 18..<25: return .yellow
        default: return .red
        }
    }
}
