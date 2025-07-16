//
//  MaleFemaleFatView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 10/05/25.
//

import SwiftUI

struct BodyFatCalculatorView: View {
    @StateObject private var viewModel = BodyFatCalculatorViewModels()
    
    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackgroundView()
                
                ScrollView {
                    VStack(spacing: 24) {
                        Text("💪 Body Fat Calculator")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Color.purple, Color.blue],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .multilineTextAlignment(.center)
                            .padding(.top, 40)
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                        
                        Picker("Gender", selection: $viewModel.gender) {
                            ForEach(viewModel.genders, id: \.self) { Text($0) }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        
                        VStack(spacing: 20) {
                            CustomTextField2(placeholder: "Waist (cm)", text: $viewModel.waist)
                            CustomTextField2(placeholder: "Neck (cm)", text: $viewModel.neck)
                            CustomTextField2(placeholder: "Height (cm)", text: $viewModel.height)
                            
                            if viewModel.gender == "Female" {
                                CustomTextField2(placeholder: "Hip (cm)", text: $viewModel.hip)
                            }
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                        .padding(.horizontal)
                        
                        Button(action: {
                            viewModel.calculateBodyFat()
                        }) {
                            Text("🎯 Calculate")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(LinearGradient(colors: [.blue, .purple],
                                                           startPoint: .leading, endPoint: .trailing))
                                .foregroundColor(.white)
                                .cornerRadius(14)
                        }
                        .padding(.horizontal)
                        
                        if let result = viewModel.bodyFatResult {
                            VStack(spacing: 10) {
                                Text("Your Body Fat")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text("\(result, specifier: "%.1f")%")
                                    .font(.system(size: 48, weight: .bold))
                                    .foregroundStyle(
                                        LinearGradient(colors: [.blue, .purple],
                                                       startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                            .padding(.horizontal)
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height)
                    .padding(.bottom)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct CustomTextField2: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.white.opacity(0.9))
            .cornerRadius(14)
            .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
            .keyboardType(.decimalPad)
    }
}

#Preview{
    BodyFatCalculatorView()
}
