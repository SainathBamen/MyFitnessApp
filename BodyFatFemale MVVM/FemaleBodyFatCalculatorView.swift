//
//  FemaleFatCalculatorView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 11/05/25.
//


import SwiftUI
// MARK: - View
struct FemaleBodyFatCalculatorView: View {
    @StateObject private var viewModel = FemaleBodyFatViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    Text("👩‍⚕️ Female Body Fat Calculator")
                        .fontDesign(.serif)
                        .font(.system(size: 25))
                        .foregroundColor(.pink)
                        .padding(.top)
                    
                    VStack(spacing: 16) {
                        CustomInputField3(icon: "ruler", placeholder: "Waist (cm)", text: $viewModel.waist)
                        CustomInputField3(icon: "ruler", placeholder: "Neck (cm)", text: $viewModel.neck)
                        CustomInputField3(icon: "ruler", placeholder: "Hip (cm)", text: $viewModel.hip)
                        CustomInputField3(icon: "figure.stand", placeholder: "Height (cm)", text: $viewModel.height)
                    }
                    .padding()
                    .background(.white.opacity(0.9))
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    
                    Button(action: viewModel.calculateBodyFat) {
                        Text("💖 Calculate")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.pink)
                            .foregroundColor(.white)
                            .cornerRadius(14)
                    }
                    .padding(.top, 10)
                    
                    if let result = viewModel.bodyFatResult {
                        Text("Your Body Fat: \(result, specifier: "%.1f")%")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundColor(.purple)
                            .background(.white.opacity(0.9))
                            .cornerRadius(12)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.pink.opacity(0.15), .purple.opacity(0.1)]),
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            )
            
        }
    }
}

// MARK: - Reusable Custom Input Field
struct CustomInputField3: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.pink)
            TextField(placeholder, text: $text)
                .keyboardType(.decimalPad)
        }
        .padding()
        .background(.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 3)
    }
}

// MARK: - Preview
#Preview {
    FemaleBodyFatCalculatorView()
}
