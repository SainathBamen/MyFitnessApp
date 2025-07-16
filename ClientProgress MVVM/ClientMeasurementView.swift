//
//  ClientMeasurementView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on  29/06/25.
//



import SwiftUI
import SwiftData

struct ClientMeasurementView: View {
    @Query(sort: \ClientMeasurement.date, order: .reverse) private var measurements: [ClientMeasurement]
    @Environment(\.modelContext) private var context

    @State private var weight: String = ""
    @State private var waist: String = ""
    @State private var thigh: String = ""
    @State private var date: Date = Date()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    Text("📊 Client Progress Tracker")
                        .font(.largeTitle.bold())
                        .foregroundStyle(
                            LinearGradient(colors: [.purple, .blue],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
                        )
                        .padding(.top, 30)

                    // Input Fields
                    VStack(spacing: 20) {
                        NewCustomTextField(icon: "scalemass", placeholder: "Weight (kg)", text: $weight)
                        NewCustomTextField(icon: "ruler", placeholder: "Waist (cm)", text: $waist)
                        NewCustomTextField(icon: "figure.walk", placeholder: "Thigh (cm)", text: $thigh)
                        DatePicker("📅 Date", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.compact)
                    }
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(20)
                    .padding(.horizontal)

                    // Add Button
                    Button(action: addMeasurement) {
                        Text("➕ Add Data")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .foregroundColor(.white)
                            .cornerRadius(14)
                    }
                    .padding(.horizontal)

                    // Measurements List
                    if !measurements.isEmpty {
                        Text("📑 Saved Records")
                            .font(.title2.bold())
                            .padding(.top, 20)

                        ForEach(measurements) { item in
                            VStack(alignment: .leading, spacing: 10) {
                                Text(formattedDate(item.date))
                                    .font(.headline)
                                HStack {
                                    MeasurementBox(title: "Weight", value: "\(item.weight) kg", color: .blue)
                                    MeasurementBox(title: "Waist", value: "\(item.waist) cm", color: .purple)
                                    MeasurementBox(title: "Thigh", value: "\(item.thigh) cm", color: .green)
                                }
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(14)
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteMeasurement(item)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                        .animation(.default, value: measurements)  // 👈 Important line!
                    }

                    Spacer()
                }
                .padding(.bottom, 20)
            }
            .background(LinearGradient(colors: [.white, Color(.systemGray6)], startPoint: .top, endPoint: .bottom).ignoresSafeArea())
            .navigationTitle("Client Progress")
        }
    }

    // MARK: - Add Data
    private func addMeasurement() {
        let newData = ClientMeasurement(
            weight: Double(weight) ?? 0.0,
            waist: Double(waist) ?? 0.0,
            thigh: Double(thigh) ?? 0.0,
            date: date
        )
        context.insert(newData)
        try? context.save()
        clearFields()
    }

    // MARK: - Delete Data
    private func deleteMeasurement(_ item: ClientMeasurement) {
        context.delete(item)
        try? context.save()
        print("Deleted: \(item.id)")  // Debug confirm
    }

    // MARK: - Reset Input Fields
    private func clearFields() {
        weight = ""
        waist = ""
        thigh = ""
        date = Date()
    }

    // MARK: - Date Formatter
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}


struct NewCustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.purple)
            TextField(placeholder, text: $text)
                .keyboardType(.decimalPad)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(14)
    }
}

import SwiftUI

struct MeasurementBox: View {
    var title: String
    var value: String
    var color: Color

    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ClientMeasurementView()
        .modelContainer(for: [ClientMeasurement.self], inMemory: true)
}
