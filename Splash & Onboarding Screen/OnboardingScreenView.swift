//
//  OnboardingScreenView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath Bamen on 02/04/25.
//

//import SwiftUI
//
//struct OnboardingScreenView: View {
//    var body: some View {
//        OnboardingScreen()
//    }
//}
//
//struct OnboardingScreen: View {
//    @AppStorage("currentPage") var currentPage = 1
//    let totalScreens = 3  // Define total screens
//
//    var body: some View {
//        ZStack {
//            // Gradient Background
//            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.pink.opacity(0.3)]),
//                startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
//
//            // Show Screens Based on `currentPage`
//            if currentPage == 1 {
//                ScreenView(title: "Start Your Journey", image: "fitnessImg5")
//            } else if currentPage == 2 {
//                ScreenView(title: "Stay Consistent", image: "fitnessImg1")
//            } else if currentPage == 3 {
//                ScreenView(title: "Achieve Your Goals", image: "fitnessImg4")
//            }
//        }
//    }
//}
//
//#Preview {
//    OnboardingScreenView()
//}
//
//struct ScreenView: View {
//    @AppStorage("currentPage") var currentPage = 1
//    let totalScreens = 3
//    var fontSize = 28
//
//    var title: String
//    var image: String
//
//    var body: some View {
//        VStack {
//            // Top Section with Title & Skip Button
//            HStack {
//                Text("Build Your Dream Physique")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.black)
//
//                Spacer()
//
//                Button(action: {
//                    currentPage = totalScreens  // Skip to last screen
//                }) {
//                    Text("SKIP")
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black)
//                        .padding(8)
//                }
//            }
//            .padding(.horizontal)
//            .padding(.top, 20)
//
//            Spacer()
//
//            // Fitness Image
//            Image(image)  // Dynamic image loading
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(height: 520)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//                .shadow(radius: 5)
//                .padding(.horizontal)
//
//            Spacer()
//
//            // Headline Text
//            Text(title)
//                .font(.largeTitle)
//                .fontWeight(.heavy)
//                .foregroundColor(.white)
//                .kerning(1.2)
//                .shadow(radius: 2)
//                .padding(.bottom, 10)
//
//            // Next Button
//            Button(action: {
//                if currentPage < totalScreens {
//                    currentPage += 1
//                } else {
//                    currentPage = 1  // Reset when last screen is reached
//                }
//            }) {
//                Text(currentPage == totalScreens ? "Get Started" : "Next")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .frame(height: 55)
//                    .background(
//                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.pink]),
//                                       startPoint: .leading, endPoint: .trailing)
//                    )
//                    .clipShape(Capsule())
//                    .shadow(radius: 5)
//                    .padding(.horizontal)
//            }
//
//            Spacer()
//        }
//        .padding(.bottom, 40)
//    }
//}

import SwiftUI

struct UltraModernOnboardingView: View {
    @State private var currentPage = 0
    @State private var showMainView = false

    let onboardingItems = [
        OnboardingItem(image: "flame.fill", title: "Track Real-Time 🔥", description: "Live calorie, steps and heart stats."),
        OnboardingItem(image: "sparkles", title: "Motivate Yourself ✨", description: "Get badges and rewards as you go."),
        OnboardingItem(image: "person.3.fill", title: "Squad Challenge 👊", description: "Compete and climb the leaderboard.")
    ]

    var body: some View {
        ZStack {
            // Gradient Background
            LinearGradient(gradient: Gradient(colors: [
                Color(hex: "#5EE7DF"),
                Color(hex: "#3A8DFF"),
                Color(hex: "#FC5C7D"),
                Color(hex: "#FDC830")
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()

            TabView(selection: $currentPage) {
                ForEach(0..<onboardingItems.count, id: \.self) { index in
                    VStack(spacing: 20) {
                        Spacer()

                        Image(systemName: onboardingItems[index].image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 160, height: 160)
                            .foregroundColor(.white)

                        Text(onboardingItems[index].title)
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)

                        Text(onboardingItems[index].description)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.85))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)

                        Spacer()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            VStack {
                Spacer()

                // Page Dots
                HStack(spacing: 12) {
                    ForEach(0..<onboardingItems.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? .white : .white.opacity(0.3))
                            .frame(width: index == currentPage ? 14 : 8, height: 8)
                            .scaleEffect(index == currentPage ? 1.3 : 1)
                            .animation(.spring(), value: currentPage)
                    }
                }
                .padding(.bottom, 80)

                // Next / Get Started Button
                Button {
                    if currentPage < onboardingItems.count - 1 {
                        currentPage += 1
                    } else {
                        showMainView = true
                    }
                } label: {
                    Text(currentPage == onboardingItems.count - 1 ? "Let’s Go 🚀" : "Next")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(16)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 30)
            }
        }
        .fullScreenCover(isPresented: $showMainView) {
            SignUpView()
        }
    }
}

// Data Model
struct OnboardingItem {
    let image: String
    let title: String
    let description: String
}

// Final Destination Screen
struct MainAppView: View {
    var body: some View {
        Text("🔥 Welcome to New Fitness Hub")
            .font(.largeTitle.bold())
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
    }
}

// Color Hex Extension
//extension Color {
//    init(hex: String) {
//        let scanner = Scanner(string: hex)
//        _ = scanner.scanString("#")
//        var rgb: UInt64 = 0
//        scanner.scanHexInt64(&rgb)
//        let r = Double((rgb >> 16) & 0xFF) / 255
//        let g = Double((rgb >> 8) & 0xFF) / 255
//        let b = Double(rgb & 0xFF) / 255
//        self.init(red: r, green: g, blue: b)
//    }
//}

#Preview {
    UltraModernOnboardingView()
}
