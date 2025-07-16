//
//  LottieNGoalView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 03/07/25.
//

import SwiftUI

struct LottieNGoalView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // Fixed-size Lottie Animation
                
                GoalCalculatorView()

                LottieView2()
                    .frame(width: 130, height: 130)
                    .padding(.top, 10)
                    .scaleEffect(0.17)

            }
            .navigationTitle("My Goal Tracker")
        }
    }
}

#Preview {
    LottieNGoalView()
}
