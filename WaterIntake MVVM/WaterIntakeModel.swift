//
//  WaterIntakeModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 10/06/25.
//

import SwiftUI

struct WaterIntake {
    let weight: Double
    var intake: Double {
        weight * 0.033
    }
}

