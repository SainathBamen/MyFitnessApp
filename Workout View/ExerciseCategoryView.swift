//
//  ExerciseCategoryView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 09/07/25.
//

import SwiftUI

struct ExerciseListView: View {
    @StateObject private var viewModel = ExerciseViewModel()
    @State private var expandedSections: Set<UUID> = []

    let columns = [GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.categories) { category in
                        VStack(alignment: .leading, spacing: 12) {
                            // Category Header
                            HStack {
                                Text(category.title)
                                    .font(.title3.bold())
                                    .foregroundStyle(LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing))
                                    .lineLimit(2)

                                Spacer()

                                Button {
                                    withAnimation {
                                        toggleSection(category)
                                    }
                                } label: {
                                    Image(systemName: expandedSections.contains(category.id) ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                                        .font(.title3)
                                        .foregroundColor(.blue)
                                }
                            }

                            // Exercises List
                            if expandedSections.contains(category.id) {
                                VStack(alignment: .leading, spacing: 8) {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 12) {
                                            ForEach(category.exercises, id: \.self) { exercise in
                                                Text(exercise)
                                                    .font(.footnote)
                                                    .padding(.vertical, 6)
                                                    .padding(.horizontal, 12)
                                                    .background(Color(.systemGray5))
                                                    .cornerRadius(20)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(LinearGradient(colors: [.white, .blue.opacity(0.05)], startPoint: .top, endPoint: .bottom))
                                .shadow(color: .black.opacity(0.04), radius: 4, x: 0, y: 3)
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("🏋️‍♂️ Exercises")
        }
    }

    private func toggleSection(_ category: ExerciseCategory) {
        if expandedSections.contains(category.id) {
            expandedSections.remove(category.id)
        } else {
            expandedSections.insert(category.id)
        }
    }
}

#Preview {
    ExerciseListView()
}
