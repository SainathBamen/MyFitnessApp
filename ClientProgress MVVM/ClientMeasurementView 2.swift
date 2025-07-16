//
//  ClientMeasurementView 2.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 10/07/25.
//


import SwiftUI
import SwiftData

struct ClientMeasurementView: View {
    @Query(sort: \.date, order: .reverse) private var measurements: [ClientMeasurement]  // 👈 live data
    @Environment(\.modelContext) private var context

    @State private var weight: String = ""
    @State private var waist: String = ""
    @State private var thigh: String = ""
    @State private var date: Date = Date()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    Text("📊 Client Progress\n            Tracker")
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.leading)
                        .lineSpacing(4)
                        .foregroundStyle(
                            LinearGradient(colors: [.purple, .blue],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
                        )
                        .padding(.top, 30)

                    // Input Section
                    VStack(spacing: 20) {
                        NewCustomTextField(icon: "scalemass", placeholder: "Weight (kg)", text: $weight)
                        NewCustomTextField(icon: "ruler", placeholder: "Waist (cm)", text: $waist)
                        NewCustomTextField(icon: "figure.walk", placeholder: "Thigh (cm)", text: $thigh)

                        DatePicker("📅 Select Date", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .padding(.vertical, 8)
                    }
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 4)
                    .padding(.horizontal)

                    // Add Button
                    Button(action: addMeasurement) {
                        Text("➕ Add Data")
                            .font(.system(size: 18, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(colors: [.blue, .purple],
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(14)
                            .shadow(radius: 6)
                    }
                    .padding(.horizontal)

                    // Records List
                    if !measurements.isEmpty {
                        Text("📑 Saved Records")
                            .font(.title2.bold())
                            .padding(.top, 20)

                        ForEach(measurements) { data in
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Text(formattedDate(data.date))
                                        .font(.headline)
                                    Spacer()
                                }

                                HStack(spacing: 16) {
                                    MeasurementBox(title: "Weight", value: String(format: "%.1f kg", data.weight), color: .blue)
                                    MeasurementBox(title: "Waist", value: String(format: "%.1f cm", data.waist), color: .purple)
                                    MeasurementBox(title: "Thigh", value: String(format: "%.1f cm", data.thigh), color: .green)
                                }
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(18)
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteMeasurement(data)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }

                    Spacer()
                }
            }
            .background(
                LinearGradient(colors: [.white, Color(.systemGray6)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            )
        }
    }

    // Add Measurement
    private func addMeasurement() {
        let newData = ClientMeasurement(
            weight: Double(weight) ?? 0.0,
            waist: Double(waist) ?? 0.0,
            thigh: Double(thigh) ?? 0.0,
            date: date
        )

        context.insert(newData)

        do {
            try context.save()
            clearFields()
        } catch {
            print("Error saving: \(error.localizedDescription)")
        }
    }

    // Delete Measurement
    private func deleteMeasurement(_ measurement: ClientMeasurement) {
        context.delete(measurement)
        do {
            try context.save()
        } catch {
            print("Error deleting: \(error.localizedDescription)")
        }
    }

    // Clear input fields
    private func clearFields() {
        weight = ""
        waist = ""
        thigh = ""
        date = Date()
    }

    // Date format
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
