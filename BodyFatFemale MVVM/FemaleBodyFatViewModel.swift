//
//  FemaleBodyFatViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//

import SwiftUI
// MARK: - ViewModel
class FemaleBodyFatViewModel: ObservableObject {
    @Published var waist: String = ""
    @Published var neck: String = ""
    @Published var hip: String = ""
    @Published var height: String = ""
    @Published var bodyFatResult: Double? = nil

    func calculateBodyFat() {
        guard let waistValue = Double(waist),
              let neckValue = Double(neck),
              let hipValue = Double(hip),
              let heightValue = Double(height) else {
            bodyFatResult = nil
            return
        }

        let measurement = FemaleBodyMeasurement(
            waist: waistValue,
            neck: neckValue,
            hip: hipValue,
            height: heightValue
        )

        calculateBodyFat(with: measurement)
    }

    private func calculateBodyFat(with measurement: FemaleBodyMeasurement) {
        guard (measurement.waist + measurement.hip) > measurement.neck else {
            bodyFatResult = nil
            return
        }

        let result = ((measurement.waist + measurement.hip - measurement.neck) / measurement.height) * 10
        bodyFatResult = round(result * 10) / 10
    }
}
