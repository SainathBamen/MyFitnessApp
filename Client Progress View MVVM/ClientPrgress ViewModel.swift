//
//  ClientPrgress ViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 14/07/25.
//

import SwiftUI
import SwiftData

// MARK: - ViewModel
class BodyMeasurementViewModel: ObservableObject {
    @Published var month = ""
    @Published var weight = ""
    @Published var waist = ""
    @Published var neck = ""
    @Published var thighs = ""
    
    @Published var measurements: [BodyMeasurements] = []
    
    var context: ModelContext?
    
    func setContext(_ context: ModelContext) {
        self.context = context
        fetchMeasurements()
    }
    
    func addMeasurement() {
        guard let context else { return }
        
        let newMeasurement = BodyMeasurements(
            month: month,
            weight: Double(weight) ?? 0.0,
            waist: Double(waist) ?? 0.0,
            neck: Double(neck) ?? 0.0,
            thighs: Double(thighs) ?? 0.0
        )
        
        context.insert(newMeasurement)
        do {
            try context.save()
        } catch {
            print("Failed to save measurement: \(error)")
        }

        fetchMeasurements()
        clearFields()
    }

    func fetchMeasurements() {
        guard let context else { return }
        let descriptor = FetchDescriptor<BodyMeasurements>(sortBy: [SortDescriptor(\.month)])
        measurements = (try? context.fetch(descriptor)) ?? []
    }
    
    func deleteMeasurement(at index: Int) {
        guard let context else { return }
        
        let measurement = measurements[index]
        context.delete(measurement)
        
        do {
            try context.save()
            fetchMeasurements()
        } catch {
            print("Failed to delete measurement: \(error)")
        }
    }
    
    func clearFields() {
        month = ""
        weight = ""
        waist = ""
        neck = ""
        thighs = ""
    }
}

