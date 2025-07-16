//
//  VegProteinView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 02/04/25.
//


import SwiftUI

struct FoodDetailSheetView: View {
    let food: ProteinRichFood

    //Action sheet design done here.
    var body: some View {
        VStack(spacing: 20) {
            Image(food.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .shadow(radius: 10)

            Text(food.name)
                .font(.title)
                .fontWeight(.bold)

            VStack(alignment: .leading, spacing: 8) {
                Text("🍽️ Calories: \(food.calories) kcal")
                Text("💪 Protein: \(food.protein, specifier: "%.1f") g")
                Text("🥔 Carbs: \(food.carbohydrates, specifier: "%.1f") g")
                Text("🧈 Fat: \(food.fat, specifier: "%.1f") g")
                Text("🍊 Vitamins: \(food.vitamins)")
            }
            .font(.body)

            Spacer()
        }
        .padding()
    }
}

//For showing Action Sheet by using Navigation Stack.
struct VegProteinView2: View {
    @StateObject var viewModel = ProteinRichFoodViewModel()
    @State private var selectedFood: ProteinRichFood? = nil
    @State private var showSheet = false

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.foods) { food in
                        FoodCardView(food: food)
                            .onTapGesture {
                                selectedFood = food
                                showSheet = true
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("Protein-Rich Foods")
            .sheet(isPresented: $showSheet) {
                if let selected = selectedFood {
                    FoodDetailSheetView(food: selected)
                        .presentationDetents([.medium, .large]) // optional: medium & large sheet sizes
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}

//FirstView for showing data on view.
struct FoodCardView: View {
    let food: ProteinRichFood

    var body: some View {
        HStack(spacing: 16) {
            Image(food.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 5)

            VStack(alignment: .leading, spacing: 6) {
                Text(food.name)
                    .font(.headline)
                    .fontWeight(.semibold)

                Text("Protein: \(food.protein, specifier: "%.1f") g")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}

#Preview {
    VegProteinView2()
}
