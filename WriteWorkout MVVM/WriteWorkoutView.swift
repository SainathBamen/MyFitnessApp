//
//  WriteWorkoutView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 12/07/25.
//

import SwiftUI

struct WriteWorkoutView: View {
    var body: some View {
        ZStack {
            // Card Content
            VStack(spacing: 16) {
                VStack(spacing: 8) {
                    Text("📝 Write Your Today's Workout")
                        .font(.system(size: 22, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(
                            LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)
                        )

                    Text("Stay consistent, stay fit!")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 6)

                    NavigationLink(destination: ClientProgress_View()) {
                        Text("Add Workout")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(12)
                    }
                    .padding(.top, 8)
                }
                .padding(14)
                .background(.ultraThinMaterial)
                .cornerRadius(18)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(
                            LinearGradient(colors: [.purple.opacity(0.35), .blue.opacity(0.35)], startPoint: .topLeading, endPoint: .bottomTrailing),
                            lineWidth: 0.8
                        )
                )
                .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
            }
            .padding(14)
            .background(
                LinearGradient(colors: [.white, .blue.opacity(0.06)], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(20)
        }
        .frame(maxWidth: 390) // <-- important: bounded frame
    }
}



#Preview {
    WriteWorkoutView()
}
