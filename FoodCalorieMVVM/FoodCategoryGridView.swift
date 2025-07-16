//
//  FoodCategoryGridView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//

import SwiftUI

struct FoodCategoryGridView: View {
    @StateObject private var viewModel = FoodCategoryViewModel()

    let columns = [GridItem(.adaptive(minimum: 180), spacing: 16)]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.categories) { category in
                        NavigationLink(destination: viewModel.destinationView(for: category)) {
                            CategoryGridItem(title: "\(category.emoji) \(category.title)")
                                .scaleEffect(0.98)
                                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: category.id)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 24)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.white, Color(.systemGroupedBackground)]),
                                       startPoint: .top, endPoint: .bottom))
            .navigationTitle("🍽️ Food Categories")
        }
    }
}

struct CategoryGridItem: View {
    var title: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.6), .pink.opacity(0.6)]),
                                     startPoint: .topLeading, endPoint: .bottomTrailing))
                .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 4)

            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
        }
        .frame(height: 140)
    }
}

struct SupplementsListView: View {
    var body: some View {
        List {
            Label("Whey Protein", systemImage: "capsule.fill")
            Label("Multivitamin", systemImage: "pills.fill")
            Label("Omega-3", systemImage: "drop.fill")
            Label("Vitamin D3", systemImage: "sun.max.fill")
            Label("Creatine", systemImage: "bolt.circle.fill")
        }
        .navigationTitle("💊 Supplements")
    }
}
