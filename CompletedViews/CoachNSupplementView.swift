//
//  CoachNSupplementView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 03/07/25.
//

import SwiftUI

struct CoachNSupplementView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {  // <-- Add ScrollView
            LazyVGrid(columns: columns, spacing: 10) {
                // Grid Item 1
                NavigationLink(destination: AppTrainersView()) {
                    ActionCardView(
                        imageName: "bodyBuilderImg",
                        title: "Hire a Coach",
                        gradient: Gradient(colors: [.blue, .gray.opacity(0.3)])
                    )
                }

                // Grid Item 2
                NavigationLink(destination: SupplementShopView()) {
                    ActionCardView(
                        imageName: "supplementImg",
                        title: "Buy Supplements",
                        gradient: Gradient(colors: [.blue, .gray.opacity(0.3)])
                    )
                }
                
            }
            .padding(.horizontal, 26)
            .padding(.vertical, 20)
        }
    }
}




// MARK: - Action Card View
struct ActionCardView: View {
    let imageName: String
    let title: String
    let gradient: Gradient

    var body: some View {
        VStack(spacing: 14) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 140, height: 120)
                .clipShape(Circle())
                .shadow(radius: 5)

            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 6)
        }
        .frame(height: 200)
        .frame(maxWidth: 200)
        .background(
            LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 3)
    }
}



#Preview {
    NavigationStack {
        CoachNSupplementView()
    }
}
