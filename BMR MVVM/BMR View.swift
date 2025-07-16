import SwiftUI

struct BMRCalculatorView: View {
    @StateObject private var viewModel = BMRViewModel()
    @State private var showResult = false

    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackgroundView()
                ScrollView {
                    
                    VStack(spacing: 32) {
                        
                        // Gender Picker
                        VStack(alignment: .leading, spacing: 8) {
                            Label("Gender", systemImage: "figure.stand")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Picker("Gender", selection: $viewModel.gender) {
                                ForEach(viewModel.genders, id: \.self) {
                                    Text($0)
                                        .fontWeight(.medium)
                                }
                            }
                            .pickerStyle(.segmented)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 6)
                            .background(Color(.systemGray6))
                            .cornerRadius(14)
                            .onChange(of: viewModel.gender) {
                                withAnimation {
                                    viewModel.resetValues()
                                    showResult = false
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // Input Fields
                        VStack(spacing: 20) {
                            CustomInputField(icon: "scalemass", placeholder: "Weight (kg)", value: $viewModel.weight)
                            CustomInputField(icon: "ruler", placeholder: "Height (cm)", value: $viewModel.height)
                            CustomInputField(icon: "person.fill", placeholder: "Age (years)", value: $viewModel.age)
                        }
                        
                        // Activity Picker
                        VStack(alignment: .leading, spacing: 8) {
                            Label("Activity Level", systemImage: "flame.fill")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Picker("Activity Level", selection: $viewModel.selectedActivity) {
                                ForEach(viewModel.activities.indices, id: \.self) { index in
                                    Text(viewModel.activities[index].description)
                                }
                            }
                            .pickerStyle(.menu)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(16)
                            .shadow(color: .gray.opacity(0.06), radius: 2)
                        }
                        .padding(.horizontal)
                        
                        // Calculate Button
                        Button {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                viewModel.calculateBMR()
                                showResult = viewModel.bmr != nil
                            }
                        } label: {
                            Text("Calculate")
                                .font(.headline)
                                .padding(.vertical, 14)
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(colors: [.blue, .cyan], startPoint: .leading, endPoint: .trailing)
                                )
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(color: .blue.opacity(0.35), radius: 6, x: 0, y: 4)
                        }
                        .padding(.horizontal)
                        .scaleEffect(showResult ? 1.05 : 1.0)
                        .animation(.spring(response: 0.35, dampingFraction: 0.7), value: showResult)
                        
                        // Result View
                        if let bmr = viewModel.bmr, let calories = viewModel.calories, showResult {
                            VStack(spacing: 16) {
                                HStack(spacing: 10) {
                                    Image(systemName: "brain.head.profile")
                                        .foregroundColor(.purple)
                                    Text("BMR: \(Int(bmr)) kcal/day")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                }
                                HStack(spacing: 10) {
                                    Image(systemName: "flame.fill")
                                        .foregroundColor(.orange)
                                    Text("Calories: \(Int(calories)) kcal/day")
                                        .font(.headline)
                                        .foregroundColor(.orange)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                            .cornerRadius(22)
                            .shadow(radius: 8)
                            .padding(.horizontal)
                            .transition(.opacity.combined(with: .scale))
                        }
                    }
                    .padding(.bottom, 40)
                }
                .background(
                    LinearGradient(colors: [.white, .blue.opacity(0.05)], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                )
                .navigationTitle("BMR Calculator")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

// MARK: - Custom Input Field

struct CustomInputField: View {
    var icon: String
    var placeholder: String
    @Binding var value: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .foregroundColor(.blue)
            TextField(placeholder, text: $value)
                .keyboardType(.decimalPad)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.08), radius: 2)
        .padding(.horizontal)
    }
}

// MARK: - Preview

#Preview {
    BMRCalculatorView()
}
