//
//  Exercise Video&List View.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 09/07/25.
//

import SwiftUI

struct ExerciseVideoListView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    // Title: Workout Videos
                    Text("🎥 Workout Videos")
                        .font(.title2.bold())
                        .padding(.horizontal)

                    // Workout Video List
                    WorkoutHomeView()

                    // Title: Exercise Categories
                    Text("📋 Exercise Categories")
                        .font(.title2.bold())
                        .padding(.horizontal)

                    // Exercise List
                    ExerciseListView()
                }
                .padding(.top) // 👈 सिर्फ ऊपर से padding
            }
            .navigationTitle("🏋️‍♂️ Fitness Hub")
        }
    }
}

#Preview {
    ExerciseVideoListView()
}
