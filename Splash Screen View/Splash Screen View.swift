//
//  Splash Screen View.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 13/06/25.
//


import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var animateLogo = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(hex: "#ff6e7f"), Color(hex: "#bfe9ff")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Image(systemName: "bolt.heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .scaleEffect(animateLogo ? 1.1 : 0.9)
                    .opacity(animateLogo ? 1 : 0.7)
                    .shadow(color: .white.opacity(0.6), radius: 12, x: 0, y: 5)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animateLogo)

                Text("Fitness Pro")
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(colors: [.white, .white.opacity(0.85)], startPoint: .leading, endPoint: .trailing)
                    )
                    .shadow(color: .black.opacity(0.25), radius: 3, x: 0, y: 3)

                Text("Track. Transform. Triumph.")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.9))
                    .padding(.top, 4)
            }
            .opacity(isActive ? 0 : 1)
        }
        .onAppear {
            animateLogo = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeOut(duration: 0.5)) {
                    isActive = true
                }
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            UltraModernOnboardingView()
        }
    }
}

#Preview {
    SplashScreenView()
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        
        self.init(red: r, green: g, blue: b)
    }
}
