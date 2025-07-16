//
//  FoodCalorieViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/06/25.
//


import SwiftUI

class FoodCategoryViewModel: ObservableObject {
    @Published var categories: [FoodCategory] = [
        FoodCategory(title: "Fruits", emoji: "🍉"),
        FoodCategory(title: "Veg Proteins", emoji: "🥦"),
        FoodCategory(title: "Non-Veg Proteins", emoji: "🍗"),
        FoodCategory(title: "Supplements", emoji: "💊")
    ]

    // Return destination view based on title
    @ViewBuilder
    func destinationView(for category: FoodCategory) -> some View {
        switch category.title {
        case "Fruits":
            MyFruitsListView()
        case "Veg Proteins":
            VegProteinView2()
        case "Non-Veg Proteins":
            NonVegView()
        case "Supplements":
            SupplementsListView()
        default:
            Text("Coming Soon")
        }
    }
}

