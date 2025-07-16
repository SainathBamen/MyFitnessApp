//
//  ClientProgress View.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 14/07/25.
//


import SwiftUI
import SwiftData




// MARK: - View
struct ClientProgress_View: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = BodyMeasurementViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // Title
                Text("📊 Client Progress")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)
                    )
                    .padding(.top, 10)
                
                // Input Card
                VStack(alignment: .leading, spacing: 16) {
                    Text("➕ Add New Measurement")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Group {
                        customTextField("Month (e.g. July)", text: $viewModel.month)
                        customTextField("Weight (kg)", text: $viewModel.weight, isDecimal: true)
                        customTextField("Waist (cm)", text: $viewModel.waist, isDecimal: true)
                        customTextField("Neck (cm)", text: $viewModel.neck, isDecimal: true)
                        customTextField("Thighs (cm)", text: $viewModel.thighs, isDecimal: true)
                    }

                    Button(action: {
                        viewModel.addMeasurement()
                    }) {
                        Text("💾 Save Measurement")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(14)
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(colors: [.purple.opacity(0.3), .blue.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing),
                            lineWidth: 0.8
                        )
                )
                
                // Saved Measurements List
                if viewModel.measurements.isEmpty {
                    Text("No measurements added yet.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    Text("📈 Saved Measurements")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.bottom, 8)
                    
                    VStack(spacing: 12) {
                        ForEach(Array(viewModel.measurements.enumerated()), id: \.element) { index, item in
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("📅 \(item.month)")
                                        .font(.headline)
                                        .foregroundStyle(.blue)
                                    Spacer()
                                    // Delete Button
                                    Button {
                                        viewModel.deleteMeasurement(at: index)
                                    } label: {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                    }
                                }

                                Divider()

                                HStack {
                                    Text("Weight: \(item.weight, specifier: "%.1f") kg")
                                    Spacer()
                                    Text("Waist: \(item.waist, specifier: "%.1f") cm")
                                }
                                HStack {
                                    Text("Neck: \(item.neck, specifier: "%.1f") cm")
                                    Spacer()
                                    Text("Thighs: \(item.thighs, specifier: "%.1f") cm")
                                }
                            }
                            .padding()
                            .background(.white)
                            .cornerRadius(14)
                            .shadow(color: .gray.opacity(0.15), radius: 5, x: 0, y: 3)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .background(
            LinearGradient(colors: [.white, .blue.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        )
        .onAppear {
            viewModel.setContext(context)
        }
    }
    
    // MARK: - Custom TextField
    @ViewBuilder
    func customTextField(_ placeholder: String, text: Binding<String>, isDecimal: Bool = false) -> some View {
        TextField(placeholder, text: text)
            .keyboardType(isDecimal ? .decimalPad : .default)
            .padding()
            .background(.white)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
    }
}

#Preview {
    ClientProgress_View()
}
