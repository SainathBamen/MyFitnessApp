//
//  BMICalculatorView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 12/06/25.
//


import SwiftUI

class BMICalculatorViewModel: ObservableObject {
    @Published var weight = ""
    @Published var height = ""
    @Published var bmi = ""

    func calculateBMI() {
        let w = Double(weight) ?? 0
        let h = Double(height) ?? 0

        if w > 0 && h > 0 {
            let heightInMeters = h / 100
            let bmiValue = w / (heightInMeters * heightInMeters)
            bmi = String(format: "%.1f", bmiValue)
        } else {
            bmi = "0.0"
        }
    }
}
