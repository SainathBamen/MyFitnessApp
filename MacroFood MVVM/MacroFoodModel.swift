//
//  MacroFoodModel.swift
//  Reminder App In SwiftUI
//  Created by Sainath bamen on 12/04/25.
//

import SwiftUI

struct Macro {
    let proteinGrams: Int
    let carbGrams: Int
    let fatGrams: Int

    var proteinCalories: Int {
        proteinGrams * 4
    }

    var carbCalories: Int {
        carbGrams * 4
    }

    var fatCalories: Int {
        fatGrams * 9
    }

    var totalCalories: Int {
        proteinCalories + carbCalories + fatCalories
    }
}

