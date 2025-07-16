//
//  MacroFoodView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//

import SwiftUI

struct MacroCalculatorView: View {
    @StateObject private var viewModel = MacroCalculatorViewModel()

    var body: some View {
        ZStack {
            GradientBackgroundView()

            VStack(spacing: 24) {
                Text("🍽️ Macro to Calories")
                    .font(.system(size: 32, weight: .heavy))
                    .foregroundColor(.white)
                    .padding(.top)

                VStack(spacing: 16) {
                    MacroInputField(title: "🥩 Protein in (grams)", text: $viewModel.proteinGrams)
                    MacroInputField(title: "🍞 Carbs in (grams)", text: $viewModel.carbGrams)
                    MacroInputField(title: "🧈 Fats in (grams)", text: $viewModel.fatGrams)
                }
                .padding()
                .background(.ultraThickMaterial)
                .cornerRadius(20)
                .shadow(radius: 10)

                Button(action: {
                    viewModel.calculateMacros()
                }) {
                    Text("🔥 Calculate Calories")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(14)
                }
                .padding(.horizontal)

                if let result = viewModel.resultMacro {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("🔥 Protein Calories: \(result.proteinCalories)")
                        Text("🔥 Carb Calories: \(result.carbCalories)")
                        Text("🔥 Fat Calories: \(result.fatCalories)")

                        Divider().background(.white)

                        Text("🍭 Total Calories: \(result.totalCalories)")
                            .font(.title2.bold())
                            .foregroundColor(.yellow)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.ultraThickMaterial)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct MacroInputField: View {
    let title: String
    @Binding var text: String

    var body: some View {
        TextField(title, text: $text)
            .keyboardType(.numberPad)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
