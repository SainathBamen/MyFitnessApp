//
//  VegProteinViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 02/04/25.
//


import Foundation

class ProteinRichFoodViewModel: ObservableObject {
    @Published var foods: [ProteinRichFood] = []
    
    init() {
        loadFoods()
    }
    
    public func loadFoods() {
        foods = [
            ProteinRichFood(name: "Lentils", calories: 116, protein: 9, carbohydrates: 20, fat: 0.4, vitamins: "Folate, Iron, Vitamin B6", imageName: "LentilImg"),
            ProteinRichFood(name: "Chickpeas", calories: 164, protein: 8.9, carbohydrates: 27, fat: 2.6, vitamins: "Folate, Manganese, Iron", imageName: "chikPeasImage"),
            ProteinRichFood(name: "Black Beans", calories: 132, protein: 8.9, carbohydrates: 23, fat: 0.5, vitamins: "Folate, Magnesium, Iron", imageName: "BlackBeansImg"),
            ProteinRichFood(name: "Tofu", calories: 76, protein: 8, carbohydrates: 1.9, fat: 4.8, vitamins: "Calcium, Iron, Magnesium", imageName: "TofuImg"),
            ProteinRichFood(name: "Tempeh", calories: 192, protein: 20, carbohydrates: 9, fat: 10.8, vitamins: "Vitamin B2, Iron, Magnesium", imageName: "TempehImg"),
            ProteinRichFood(name: "Edamame", calories: 121, protein: 11, carbohydrates: 9, fat: 5, vitamins: "Vitamin K, Folate, Iron", imageName: "EdamameImg"),
            ProteinRichFood(name: "Quinoa", calories: 120, protein: 4.1, carbohydrates: 21.3, fat: 1.9, vitamins: "Manganese, Folate, Magnesium", imageName: "QuinoaImg"),
            ProteinRichFood(name: "Chia Seeds", calories: 486, protein: 16.5, carbohydrates: 42, fat: 30, vitamins: "Omega-3, Calcium, Magnesium", imageName: "chiaSeedImg"),
            ProteinRichFood(name: "Hemp Seeds", calories: 553, protein: 31, carbohydrates: 8.7, fat: 49, vitamins: "Vitamin E, Omega-3, Magnesium", imageName: "hempSeedImg"),
            ProteinRichFood(name: "Spinach", calories: 23, protein: 2.9, carbohydrates: 3.6, fat: 0.4, vitamins: "Vitamin A, Vitamin C, Folate", imageName: "spinachImg"),
            ProteinRichFood(name: "Peas", calories: 81, protein: 5, carbohydrates: 14, fat: 0.4, vitamins: "Vitamin C, Folate, Vitamin K", imageName: "PeasImg"),
            ProteinRichFood(name: "Broccoli", calories: 55, protein: 3.7, carbohydrates: 11, fat: 0.6, vitamins: "Vitamin K, Vitamin C, Folate", imageName: "broccoliImg"),
            ProteinRichFood(name: "Sweet Potatoes", calories: 86, protein: 1.6, carbohydrates: 20, fat: 0.1, vitamins: "Vitamin A, Vitamin C, Manganese", imageName: "Sweet PotatoesImg"),
            ProteinRichFood(name: "Almonds", calories: 576, protein: 21, carbohydrates: 22, fat: 49, vitamins: "Vitamin E, Magnesium, Calcium", imageName: "almondsImg"),
            ProteinRichFood(name: "Cashews", calories: 553, protein: 18, carbohydrates: 30, fat: 44, vitamins: "Magnesium, Iron, Vitamin E", imageName: "cashewsImg"),
            ProteinRichFood(name: "Pumpkin Seeds", calories: 446, protein: 19, carbohydrates: 54, fat: 19, vitamins: "Zinc, Iron, Magnesium", imageName: "pumpkinSeedsImg"),
            ProteinRichFood(name: "Greek Yogurt", calories: 59, protein: 10, carbohydrates: 3.6, fat: 0.4, vitamins: "Calcium, Vitamin B12, Phosphorus", imageName: "greekImg"),
            ProteinRichFood(name: "Seitan", calories: 370, protein: 75, carbohydrates: 14, fat: 1.9, vitamins: "Iron, Calcium, Vitamin B12", imageName: "veganImg"),
            ProteinRichFood(name: "Mushrooms", calories: 22, protein: 3, carbohydrates: 3.3, fat: 0.3, vitamins: "Vitamin D, Vitamin B2, Folate", imageName: ""),
            ProteinRichFood(name: "Avocados", calories: 160, protein: 2, carbohydrates: 9, fat: 15, vitamins: "Vitamin E, Vitamin C, Potassium", imageName: "avacadoImg")
        ]
    }
}

