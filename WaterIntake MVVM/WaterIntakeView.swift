//
//  WaterIntakeView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//

import SwiftUI

struct WaterIntakeView: View {
    @StateObject private var viewModel = WaterIntakeViewModel()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("💧 Daily Water Intake")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)

                VStack(spacing: 20) {
                    Text("Enter your weight in kg")
                        .font(.headline)
                        .foregroundColor(.gray)

                    TextField("e.g. 60", text: $viewModel.weightText)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 4)
                        .frame(maxWidth: 250)
                }

                Button(action: {
                    viewModel.calculateWaterIntake()
                }) {
                    Text("💧 Calculate")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: 250)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(color: Color.blue.opacity(0.3), radius: 5, x: 0, y: 4)
                }
                .padding(.top)

                if let intake = viewModel.waterIntake {
                    VStack(spacing: 10) {
                        Text("💧 You should drink:")
                            .font(.headline)
                            .foregroundColor(.gray)

                        Text(String(format: "%.2f liters per day", intake))
                            .font(.system(size: 42, weight: .bold))
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .gray.opacity(0.2), radius: 8, x: 0, y: 5)
                    .transition(.opacity.combined(with: .scale))
                }

                Spacer()
            }
            .padding()
        }
        .animation(.spring(), value: viewModel.waterIntake)
    }
}

#Preview{
    WaterIntakeView()
}
