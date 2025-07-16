//
//  ClientProgress View.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 14/07/25.
//

import SwiftUI
import SwiftData

// MARK: - Model
@Model
class BodyMeasurements {
    var month: String
    var weight: Double
    var waist: Double
    var neck: Double
    var thighs: Double
    
    init(month: String, weight: Double, waist: Double, neck: Double, thighs: Double) {
        self.month = month
        self.weight = weight
        self.waist = waist
        self.neck = neck
        self.thighs = thighs
    }
}
