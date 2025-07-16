//
//  GoalCalculorView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 02/07/25.
//

import SwiftUI
import SwiftUI

struct GoalCalculatorView: View {
    @StateObject private var viewModel = GoalCalculatorViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("🎯 Your Details")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.purple)
                .padding(.bottom, 4)

            Group {
                TextField("Current Weight (kg)", text: $viewModel.currentWeight)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)

                TextField("Target Weight (kg)", text: $viewModel.targetWeight)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)

                TextField("Duration (days)", text: $viewModel.durationInDays)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }

            Button(action: {
                viewModel.calculateCalories()
            }) {
                Text("Calculate Calories to Burn Daily")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.purple)
                    .cornerRadius(12)
            }
            .padding(.top, 6)

            if let calories = viewModel.dailyCalories {
                Divider().padding(.vertical, 10)

                Text("🔥 You need to burn")
                    .font(.headline)

                Text("\(String(format: "%.0f", calories)) kcal daily.")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }

            Spacer()
        }
        .padding(20)
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding()
    }
}
#Preview{
    GoalCalculatorView()
}
