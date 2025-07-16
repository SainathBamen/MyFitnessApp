//
//  BMICalculatorView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 12/06/25.
//

import SwiftUI

struct BMICalculatorView: View {
    @StateObject private var viewModel = BMICalculatorViewModel()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.3), .purple.opacity(0.3)]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("💪 BMI Calculator")
                    .font(.largeTitle.bold())
                    .foregroundStyle(LinearGradient(colors: [.white, .white.opacity(0.8)], startPoint: .leading, endPoint: .trailing))
                    .padding(.top)

                VStack(spacing: 24) {
                    Text("Enter your details")
                        .font(.title3.bold())
                        .foregroundColor(.white.opacity(0.8))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)

                    VStack(spacing: 20) {
                        CustomInputFields(icon: "scalemass.fill", placeholder: "Weight (kg)", text: $viewModel.weight, color: .blue)
                        CustomInputFields(icon: "ruler.fill", placeholder: "Height (cm)", text: $viewModel.height, color: .purple)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 5)
                    .padding(.horizontal)
                }

                Button(action: {
                    viewModel.calculateBMI()
                }) {
                    Text("Calculate BMI")
                        .font(.headline.bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
                                                   startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(25)
                        .shadow(color: .purple.opacity(0.4), radius: 6, x: 0, y: 4)
                }
                .padding(.horizontal)

                if !viewModel.bmi.isEmpty {
                    VStack(spacing: 8) {
                        Text("Your BMI is")
                            .font(.title3.bold())
                            .foregroundColor(.white.opacity(0.9))

                        Text(viewModel.bmi)
                            .font(.system(size: 60, weight: .heavy))
                            .foregroundStyle(LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom))
                            .shadow(color: .white.opacity(0.4), radius: 10, x: 0, y: 0)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(LinearGradient(colors: [.white.opacity(0.4), .purple.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                            .background(.ultraThinMaterial)
                            .cornerRadius(25)
                    )
                    .padding(.horizontal)
                    .shadow(radius: 10)
                }

                Spacer()
            }
            .padding()
        }
    }
}

// Custom reusable Input Field with icon and colored circle
struct CustomInputFields: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    var color: Color

    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 40, height: 40)
                Image(systemName: icon)
                    .foregroundColor(color)
            }
            TextField(placeholder, text: $text)
                .keyboardType(.decimalPad)
                .padding(.leading, 6)
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 3)
    }
}

#Preview {
    BMICalculatorView()
}
