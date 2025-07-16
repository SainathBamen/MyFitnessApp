//
//  LottieView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 01/07/25.
//


import SwiftUI
import Lottie

// MARK: - LottieView reusable view
struct LottieView: UIViewRepresentable {
    let animationName: String

    func makeUIView(context: Context) -> LottieAnimationView {
        let animationView = LottieAnimationView(name: animationName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }

    func updateUIView(_ uiView: LottieAnimationView, context: Context) {}
}

// MARK: - Animation + Text View
import SwiftUI

struct OnlyLottieAnimationView: View {
    var body: some View {
        HStack(spacing: 16) {

            // Lottie Animation
            LottieView(animationName: "Animation - 1751355708024")
                .frame(width: 120, height: 50)
                .scaleEffect(0.17)

            // Text Title
            Text("Join our fitness group")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.blue)

            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.systemGray6))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    OnlyLottieAnimationView()
}


