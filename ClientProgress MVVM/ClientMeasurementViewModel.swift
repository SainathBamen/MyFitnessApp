//
//  ClientMeasurementViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 29/06/25.
//

//import SwiftUI
//import SwiftData
//
//class ClientMeasurementViewModel: ObservableObject {
//    @Published var measurements: [ClientMeasurement] = []
//
//    @Published var weight: String = ""
//    @Published var waist: String = ""
//    @Published var thigh: String = ""
//    @Published var date: Date = Date()
//
//    var context: ModelContext!
//
//    // Add new measurement
//    func addMeasurement() {
//        let newData = ClientMeasurement(
//            weight: Double(weight) ?? 0.0,
//            waist: Double(waist) ?? 0.0,
//            thigh: Double(thigh) ?? 0.0,
//            date: date
//        )
//
//        context.insert(newData)
//
//        do {
//            try context.save()
//            fetchMeasurements()  // 🔥 Save ke baad fetch kar liya
//            clearFields()
//        } catch {
//            print("Error saving: \(error.localizedDescription)")
//        }
//    }
//
//    // Fetch all measurements
//    func fetchMeasurements() {
//        let fetchDescriptor = FetchDescriptor<ClientMeasurement>(
//            sortBy: [SortDescriptor(\.date, order: .reverse)]
//        )
//
//        do {
//            measurements = try context.fetch(fetchDescriptor)
//        } catch {
//            print("Error fetching: \(error.localizedDescription)")
//        }
//    }
//
//    // Delete a measurement
//    func deleteMeasurement(_ measurement: ClientMeasurement) {
//        context.delete(measurement)
//
//        do {
//            try context.save()
//            fetchMeasurements()  // 🔥 Delete ke baad fetch
//        } catch {
//            print("Error deleting: \(error.localizedDescription)")
//        }
//    }
//
//    // Clear input fields
//    func clearFields() {
//        weight = ""
//        waist = ""
//        thigh = ""
//        date = Date()
//    }
//
//    // Date format
//    func formattedDate(_ date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        return formatter.string(from: date)
//    }
//}
