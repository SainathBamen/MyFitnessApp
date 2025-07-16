//
//  MacroFoodViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//


import SwiftUI

class MacroCalculatorViewModel: ObservableObject {
    @Published var proteinGrams: String = ""
    @Published var carbGrams: String = ""
    @Published var fatGrams: String = ""
    @Published var resultMacro: Macro? = nil

    func calculateMacros() {
        guard let protein = Int(proteinGrams),
              let carbs = Int(carbGrams),
              let fats = Int(fatGrams) else {
            resultMacro = nil
            return
        }

        resultMacro = Macro(proteinGrams: protein, carbGrams: carbs, fatGrams: fats)
    }
}

