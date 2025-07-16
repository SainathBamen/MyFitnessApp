//
//  WaterIntakeViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//

import SwiftUI

class WaterIntakeViewModel: ObservableObject {
    @Published var weightText: String = ""
    @Published var waterIntake: Double? = nil

    func calculateWaterIntake() {
        if let weight = Double(weightText) {
            waterIntake = weight * 0.033
        } else {
            waterIntake = nil
        }
    }
}
