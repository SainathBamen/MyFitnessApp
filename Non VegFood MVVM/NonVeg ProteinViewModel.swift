//
//  NonVeg ProteinViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 02/04/25.
//


import Foundation
import Combine

class FoodViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var foodItems: [FoodItem] = [
        FoodItem(name: "Chicken Breast", calories: 165, protein: 21, fat: 3, carbs: 0, VegProteinImage: "pumpkinSeedsImg"),
        FoodItem(name: "Beef Steak", calories: 242, protein: 26, fat: 15, carbs: 0, VegProteinImage: "pumpkinSeedsImg"),
        FoodItem(name: "Fish (Salmon)", calories: 208, protein: 20, fat: 13, carbs: 0, VegProteinImage: "pumpkinSeedsImg"),
        FoodItem(name: "Turkey Breast", calories: 135, protein: 30, fat: 1, carbs: 0, VegProteinImage: "pumpkinSeedsImg"),
        FoodItem(name: "Pork Chop", calories: 232, protein: 25, fat: 14, carbs: 0, VegProteinImage: "pumpkinSeedsImg"),
        FoodItem(name: "Egg", calories: 70, protein: 6, fat: 5, carbs: 1, VegProteinImage: "pumpkinSeedsImg"),
        FoodItem(name: "Meat", calories: 230, protein: 23, fat: 9, carbs: 0, VegProteinImage: "pumpkinSeedsImg")
    ]
    
    var filteredFoodItems: [FoodItem] {
        if searchText.isEmpty {
            return foodItems
        } else {
            return foodItems.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}

