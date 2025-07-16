//
//  MaleFemaleFatViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 10/05/25.
//

import SwiftUI


class BodyFatCalculatorViewModels: ObservableObject {
    @Published var waist: String = ""
    @Published var neck: String = ""
    @Published var height: String = ""
    @Published var hip: String = ""
    @Published var gender: String = "Male"
    @Published var bodyFatResult: Double? = nil

    let genders = ["Male", "Female"]

    func calculateBodyFat() {
        guard let waistValue = Double(waist),
              let neckValue = Double(neck),
              let heightValue = Double(height),
              waistValue > neckValue else {
            bodyFatResult = nil
            return
        }

        let measurement = BodyMeasurement(
            waist: waistValue,
            neck: neckValue,
            height: heightValue,
            hip: Double(hip),
            gender: gender
        )

        bodyFatResult = calculateBodyFat(for: measurement)
    }

    private func calculateBodyFat(for measurement: BodyMeasurement) -> Double? {
        if measurement.gender == "Male" {
            let result = 86.010 * log10(measurement.waist - measurement.neck)
                         - 70.041 * log10(measurement.height)
                         + 36.76
            return result
        } else {
            guard let hipValue = measurement.hip,
                  measurement.waist + hipValue > measurement.neck else {
                return nil
            }

            let result = 163.205 * log10(measurement.waist + hipValue - measurement.neck)
                         - 97.684 * log10(measurement.height)
                         - 78.387
            return result
        }
    }
}

