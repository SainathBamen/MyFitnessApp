
//
//  WorkOutView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 12/04/25.
//

import SwiftUI

struct WorkoutListView: View {
    @ObservedObject var viewModel: WorkoutViewModel

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.workouts) { workout in
                        NavigationLink(destination: destinationView(for: workout)) {
                            WorkoutCardView(workout: workout)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("🏋️‍♂️ Gym Workouts")
        }
    }

    // 👇 Ye function check karega workout ka name, aur uske hisaab se view dega
    @ViewBuilder
    private func destinationView(for workout: WorkOutModel) -> some View {
        switch workout.name {
        case "Chest":
            ExerciseListView()
        case "Biceps":
            ExerciseListView()
        case "Legs":
            ExerciseListView()
        default:
            DefaultWorkoutView()
        }
    }
}


struct WorkoutCardView: View {
    let workout: WorkOutModel

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(LinearGradient(colors: [.white, .gray.opacity(0.2)], startPoint: .top, endPoint: .bottom))
                    .frame(width: 100, height: 100)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)

                Image(workout.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
            }

            Text(workout.name)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.primary)

            Text(workout.description)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(
            LinearGradient(
                colors: [Color(.blue), Color(.systemGray4).opacity(0.3)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(22)
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 5)
        .scaleEffect(0.98)
        .animation(.spring(response: 0.4, dampingFraction: 0.6), value: workout.id)
    }
}




struct ChestView: View {
    var body: some View {
        Text("💪 Chest Workout Screen")
            .font(.largeTitle)
            .padding()
    }
}

struct BicepsView: View {
    var body: some View {
        Text("💪 Biceps Workout Screen")
            .font(.largeTitle)
            .padding()
    }
}

struct LegsView: View {
    var body: some View {
        Text("🦵 Legs Workout Screen")
            .font(.largeTitle)
            .padding()
    }
}

struct DefaultWorkoutView: View {
    var body: some View {
        Text("Other Workout Screen")
            .font(.largeTitle)
            .padding()
    }
}

#Preview{
    WorkoutListView(viewModel: WorkoutViewModel())
 
}
