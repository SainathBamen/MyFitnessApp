//
//  ProgressView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 14/07/25.
//


import SwiftUI
import SwiftData



class BodyMeasurementViewModel: ObservableObject {
    @Published var month = ""
    @Published var weight = ""
    @Published var waist = ""
    @Published var neck = ""
    @Published var thighs = ""
    
    @Published var measurements: [BodyMeasurement] = []
    
    var context: ModelContext?
    
    func setContext(_ context: ModelContext) {
        self.context = context
        fetchMeasurements()
    }
    
    func addMeasurement() {
        guard let context else { return }
        
        let newMeasurement = BodyMeasurement(
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
        let descriptor = FetchDescriptor<BodyMeasurement>(sortBy: [SortDescriptor(\.month)])
        measurements = (try? context.fetch(descriptor)) ?? []
    }
    
    func deleteMeasurement(at offsets: IndexSet) {
        guard let context else { return }
        
        for index in offsets {
            let measurement = measurements[index]
            context.delete(measurement)
        }
        
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



struct ProgressView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = BodyMeasurementViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Add New Measurement") {
                        TextField("Month (e.g. July)", text: $viewModel.month)
                        TextField("Weight (kg)", text: $viewModel.weight)
                            .keyboardType(.decimalPad)
                        TextField("Waist (cm)", text: $viewModel.waist)
                            .keyboardType(.decimalPad)
                        TextField("Neck (cm)", text: $viewModel.neck)
                            .keyboardType(.decimalPad)
                        TextField("Thighs (cm)", text: $viewModel.thighs)
                            .keyboardType(.decimalPad)
                        
                        Button("Save Measurement") {
                            viewModel.addMeasurement()
                        }
                    }
                }
                
                List {
                    Section("Saved Measurements") {
                        ForEach(viewModel.measurements, id: \.self) { item in
                            VStack(alignment: .leading) {
                                Text("📅 \(item.month)").font(.headline)
                                Text("Weight: \(item.weight, specifier: "%.1f") kg")
                                Text("Waist: \(item.waist, specifier: "%.1f") cm")
                                Text("Neck: \(item.neck, specifier: "%.1f") cm")
                                Text("Thighs: \(item.thighs, specifier: "%.1f") cm")
                            }
                            .padding(.vertical, 5)
                        }
                        .onDelete(perform: viewModel.deleteMeasurement)
                    }
                }
            }
            .navigationTitle("Body Tracker 📊")
            .onAppear {
                viewModel.setContext(context)
            }
        }
    }
}




#Preview {
    ProgressView()
}
