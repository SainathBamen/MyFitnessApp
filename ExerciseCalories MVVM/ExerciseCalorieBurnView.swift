//
//  Exercise Calorie Burn View.swift
//  Reminder App In SwiftUI
//
//  Created by Sainath bamen on 19/04/25.
//

//Mvvm Completed.

import SwiftUI
     
// MARK: - Detail View
struct ExerciseDetailView: View {
    let exercise: Exercise

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(exercise.name)
                .font(.title)
                .bold()
            HStack{
                Image(exercise.image)
            }

            Text("🔥 \(exercise.caloriesPerHour) calories burned per hour")
                .font(.headline)
                .foregroundColor(.red)

            Text(exercise.description)
                .font(.body)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
    }
}

// MARK: - Main View
struct ExerciseCalorieBurnView: View {
    @State private var selectedExercise: Exercise? = nil

    var body: some View {
        NavigationStack {
            List(sampleExercises) { exercise in
                VStack(alignment: .leading, spacing: 8) {
                    Text(exercise.name)
                        .font(.headline)

                    Text("🔥 \(exercise.caloriesPerHour) cal/hour")
                        .font(.subheadline)
                        .foregroundColor(.red)

                    Text(exercise.description)
                        .font(.body)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
                .padding(8)
                .onTapGesture {
                    selectedExercise = exercise
                }
            }
            .navigationTitle("Exercise & Calories")
            .sheet(item: $selectedExercise) { exercise in
                ExerciseDetailView(exercise: exercise)
                    .presentationDetents([.fraction(0.5)])
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ExerciseCalorieBurnView()
}
