//
//  Fitness_App_In_SwiftUIApp.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 28/03/25.
//


//@main
//struct Fitness_App_In_SwiftUIApp: App {
//    var body: some Scene {
////        WindowGroup {
////            ContentView()
////        }
//        
//        WindowGroup {
//            
//            PersonalWorkView()
//                }
//                .modelContainer(for: PersonalWork.self)
//    }
//}


//
//import SwiftUI
//import SwiftData
//
//
//
//@main
//struct FitnessAppInSwiftUIApp: App {
//    @State private var showSplash = true
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .modelContainer(for: Workout.self)  // 👈 PersonalWork se change kar diya Workout ke liye
//    }
//
//    @ViewBuilder
//    private func ContentView() -> some View {
//        if showSplash {
//            SplashScreenView()
//                .onAppear {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                        showSplash = false
//                    }
//                }
//        } else {
//            ToolsViews()
//
//        }
//    }
//}
//

//
//import SwiftUI
//import SwiftData
//
//@main
//struct FitnessAppInSwiftUIApp: App {
//    @State private var showSplash = true
//    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .modelContainer(for: Workout.self)
//    }
//
//    @ViewBuilder
//    private func ContentView() -> some View {
//        if showSplash {
//            SplashScreenView()
//                .onAppear {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                        showSplash = false
//                    }
//                }
//
//        } else if !hasSeenOnboarding {
//            OnboardingScreenView()
//        } else {
//            SignUpView()
//        }
//    }
//}


import SwiftUI
import SwiftData

@main
struct FitnessAppInSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            FitnessAppInSwiftUIApps()
        }
        .modelContainer(for: [PersonalWork.self, Workout.self, BodyMeasurements.self])
    }
}



struct FitnessAppInSwiftUIApps: View {
    @State private var showSplash = true
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        Group {
            if showSplash {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showSplash = false
                        }
                    }
            } else if !hasSeenOnboarding {
                UltraModernOnboardingView()
            } else if !isLoggedIn {
                SignUpView()
            } else {
                FitTabView()
//                    .modelContainer(for: [ClientMeasurement.self])
                    
            }
        }
    }
}
