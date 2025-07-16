//
//  NonVegView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 02/04/25.
//

import SwiftUI

struct NonVegView: View {
    @StateObject private var viewModel = FoodViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(text: $viewModel.searchText)

                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.filteredFoodItems) { food in
                            FoodCard(food: food)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("🍗 Non-Veg Foods")
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

struct FoodCard: View {
    let food: FoodItem

    var body: some View {
        HStack(spacing: 16) {
            Image(food.VegProteinImage)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 3)

            VStack(alignment: .leading, spacing: 6) {
                Text(food.name)
                    .font(.headline)
                    .foregroundColor(.primary)

                HStack {
                    Label("\(food.calories) kcal", systemImage: "flame.fill")
                    Label("\(food.protein, specifier: "%.1f")g P", systemImage: "bolt.fill")
                }
                .font(.caption)
                .foregroundColor(.secondary)

                HStack {
                    Text("Fat: \(food.fat, specifier: "%.1f")g")
                    Text("Carbs: \(food.carbs, specifier: "%.1f")g")
                }
                .font(.caption2)
                .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white)
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search non-veg foods...", text: $text)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
        }
        .padding(12)
        .background(Color(.systemGray5))
        .cornerRadius(12)
        .padding(.horizontal)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    NonVegView()
}
