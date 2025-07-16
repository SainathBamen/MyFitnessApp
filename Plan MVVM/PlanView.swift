//
//  PlanView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//

import SwiftUI

struct PlanView: View {
    @StateObject private var viewModel = PlanViewModel()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(Array(viewModel.buttons.enumerated()), id: \.element.id) { index, button in
                    Button(action: {
                        viewModel.selectedIndex = index
                    }) {
                        ButtonCard(
                            title: button.title,
                            systemImage: button.systemImage,
                            badge: button.badge,
                            isSelected: viewModel.selectedIndex == index
                        )
                    }
                }
            }
            .padding()
        }
        .background(
            LinearGradient(
                colors: [Color.white, Color.blue.opacity(0.3)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}


struct ButtonCard: View {
    let title: String
    let systemImage: String
    let badge: String?
    let isSelected: Bool

    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .frame(width: 100, height: 90)
                .shadow(color: .gray.opacity(0.2), radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(isSelected ? Color.yellow.opacity(0.8) : Color.clear, lineWidth: 3)
                )

            VStack(spacing: 8) {
                Image(systemName: systemImage)
                    .font(.system(size: 32))
                    .foregroundColor(.gray)

                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview{
    PlanView()
}
