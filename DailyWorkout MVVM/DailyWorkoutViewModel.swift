//
//  DailyWorkoutViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 21/06/25.




import SwiftUI
import SwiftData

class WorkoutViewModels: ObservableObject {
    private var context: ModelContext

    @Published var workoutName: String = ""
    @Published var workouts: [Workout] = []

    init(context: ModelContext) {
        self.context = context
        fetchWorkouts()
    }

    func fetchWorkouts() {
        let descriptor = FetchDescriptor<Workout>()
        do {
            workouts = try context.fetch(descriptor)
        } catch {
            print("Failed to fetch workouts: \(error.localizedDescription)")
        }
    }

    func addWorkout() {
        guard !workoutName.isEmpty else { return }
        let newWorkout = Workout(name: workoutName)
        context.insert(newWorkout)
        workoutName = ""
        fetchWorkouts()
    }

    func deleteWorkout(at offsets: IndexSet) {
        for index in offsets {
            let workoutToDelete = workouts[index]
            context.delete(workoutToDelete)
        }
        fetchWorkouts()
    }
}
