//
//  DailyWorkoutView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 21/06/25.


import SwiftUI
import SwiftData

struct DailyWorkoutView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel: WorkoutViewModels

    init(container: ModelContainer) {
        let context = container.mainContext
        _viewModel = StateObject(wrappedValue: WorkoutViewModels(context: context))
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("🏋️‍♂️ Add Your Workouts")
                    .font(.largeTitle.bold())
                    .padding(.top, 30)
                
                HStack {
                    TextField("Enter workout name", text: $viewModel.workoutName)
                        .padding()
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    
                    Button(action: {
                        viewModel.addWorkout()
                    }) {
                        Text("Add")
                            .fontWeight(.bold)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 22)
                            .background(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    .disabled(viewModel.workoutName.isEmpty)
                    .padding(.trailing)
                }

                List {
                    ForEach(viewModel.workouts) { workout in
                        HStack {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.purple)
                            Text(workout.name)
                                .font(.headline)
                        }
                        .padding(.vertical, 8)
                    }
                    .onDelete(perform: viewModel.deleteWorkout)
                }
                .listStyle(.plain)
            }
            .padding(.bottom)
            .navigationTitle("Workout Manager")
            .onAppear {
                if viewModel.workouts.isEmpty {
                    viewModel.fetchWorkouts()
                }
            }
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: Workout.self)
    return DailyWorkoutView(container: container)
        .modelContainer(container)
}

