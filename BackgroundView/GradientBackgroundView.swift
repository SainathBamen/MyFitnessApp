//
//  GradientBackgroundView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 12/06/25.
//

import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.blue.opacity(0.3), .purple.opacity(0.3)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

#Preview {
    GradientBackgroundView()
}

import SwiftUI


struct GradientButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.pink]),
                               startPoint: .leading, endPoint: .trailing)
            )
            .clipShape(Capsule())
            .shadow(radius: 5)
            .padding(.horizontal)
    }
}

