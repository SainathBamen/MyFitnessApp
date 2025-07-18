//
//  BodyFatView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 8/07/25.
//

import SwiftUI

struct BodyFatView: View {
    @StateObject private var viewModel = BodyFatViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                // Light Gradient Background
                LinearGradient(
                    gradient: Gradient(colors: [Color.gray.opacity(0.3), Color(.blue.opacity(0.3))]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        Text("💪 Body Fat Calculator")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(.linearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .multilineTextAlignment(.center)
                            .padding(.top)

                        BodyFatCustomTextField(placeholder: "Age (years)", text: $viewModel.age)
                        BodyFatCustomTextField(placeholder: "Weight (kg)", text: $viewModel.weight)
                        BodyFatCustomTextField(placeholder: "Height (cm)", text: $viewModel.height)
                        BodyFatCustomTextField(placeholder: "Waist (cm)", text: $viewModel.waist)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Gender:")
                                .font(.headline)
                            Picker("Gender", selection: $viewModel.gender) {
                                ForEach(viewModel.genders, id: \.self) { gender in
                                    Text(gender)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        .padding(.horizontal)

                        Button(action: {
                            viewModel.calculateBodyFat()
                        }) {
                            Text("Calculate")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                                .padding(.horizontal)
                        }
                        .padding(.top)

                        if let fat = viewModel.bodyFat {
                            VStack(spacing: 12) {
                                Text("Your Body Fat")
                                    .font(.headline)
                                    .foregroundColor(.gray)

                                Text("\(String(format: "%.2f", fat))%")
                                    .font(.system(size: 48, weight: .bold))
                                    .foregroundColor(viewModel.fatColor(for: fat))
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20).fill(.ultraThinMaterial))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(viewModel.fatColor(for: fat), lineWidth: 2)
                            )
                            .shadow(color: viewModel.fatColor(for: fat).opacity(0.3), radius: 8, x: 0, y: 5)
                            .padding()
                            .transition(.opacity.combined(with: .scale))
                        }
                    }
                    .padding(.bottom)
                }
            }
            .alert("Please fill all fields", isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}



struct BodyFatCustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .keyboardType(.decimalPad)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue.opacity(0.3), lineWidth: 1)
            )
            .padding(.horizontal)
    }
}



#Preview {
    BodyFatView()
}
