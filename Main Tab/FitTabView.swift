

//
//  FitTabView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 30/04/25.
//

//import SwiftUI
//
//struct FitTabView: View {
//    @State private var selectedTab = 0
//    
//    var body: some View {
//        ZStack {
//            // Gradient background behind TabView
//            LinearGradient(
//                gradient: Gradient(colors: [Color.purple.opacity(0.1), Color.blue.opacity(0.1)]),
//                startPoint: .top,
//                endPoint: .bottom
//            )
//            .ignoresSafeArea()
//            
//            TabView(selection: $selectedTab) {
//                //Tab 1
//                // Home Tab
//                CombinedHomeView()
//                    .tabItem {
//                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
//                            .font(.system(size: 24))
//                        Text("Home")
//                    }
//                    .tag(0)
//                
//                //Tab 2
//                // Search Tab
//                CombinedOfferGroupsView()
//                    .tabItem {
//                        Image(systemName: selectedTab == 1 ? "magnifyingglass.circle.fill" : "magnifyingglass.circle")
//                            .font(.system(size: 24))
//                        Text("Chats & Groups")
//                    }
//                    .tag(1)
//                
//                // Get A Coach Tab
//                NewView()
//                    .tabItem {
//                        Image(systemName: selectedTab == 2 ? "person.2.fill" : "person.2")
//                            .font(.system(size: 24))
//                        Text(" Get a Coach")
//                    }
//                    .tag(2)
//                
//                // Notification Tab
//                WorkoutHomeView()
//                    .tabItem {
//                        Image(systemName: selectedTab == 3 ? "bell.fill" : "bell")
//                            .font(.system(size: 24))
//                        Text("WVideos")
//                    }
//                    .tag(3)
//                
//                // Profile Tab
//                ToolsViews()
//                    .tabItem {
//                        Image(systemName: selectedTab == 4 ? "person.crop.circle.fill" : "person.crop.circle")
//                            .font(.system(size: 24))
//                        Text("Tools")
//                    }
//                    .tag(4)
//            }
//            .accentColor(.purple)
//            .animation(.easeInOut(duration: 0.25), value: selectedTab)
//        }
//    }
//}
//
//// MARK: - All Screens
//
//struct HomeView: View {
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color.white.ignoresSafeArea()
//                VStack(spacing: 20) {
//                    Text("🏠 Home Screen")
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .foregroundColor(.purple)
//                    
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(LinearGradient(gradient: Gradient(colors: [.purple, .blue]),
//                                             startPoint: .topLeading,
//                                             endPoint: .bottomTrailing))
//                        .frame(width: 200, height: 200)
//                        .shadow(radius: 10)
//                }
//            }
//        }
//    }
//}
//
//struct SearchView: View {
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color.white.ignoresSafeArea()
//                VStack(spacing: 20) {
//                    Text("🔍 Search Screen")
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .foregroundColor(.blue)
//                    
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
//                                             startPoint: .topLeading,
//                                             endPoint: .bottomTrailing))
//                        .frame(width: 200, height: 200)
//                        .shadow(radius: 10)
//                }
//            }
//        }
//    }
//}
//
//struct GetACoack: View {
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color.white.ignoresSafeArea()
//                VStack(spacing: 20) {
//                    Text("💪 Get A Coach")
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .foregroundColor(.green)
//                    
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(LinearGradient(gradient: Gradient(colors: [.green, .blue]),
//                                             startPoint: .topLeading,
//                                             endPoint: .bottomTrailing))
//                        .frame(width: 200, height: 200)
//                        .shadow(radius: 10)
//                }
//            }
//        }
//    }
//}
//
//struct Notification: View {
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color.white.ignoresSafeArea()
//                VStack(spacing: 20) {
//                    Text("🔔 Notifications")
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .foregroundColor(.orange)
//                    
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(LinearGradient(gradient: Gradient(colors: [.orange, .pink]),
//                                             startPoint: .topLeading,
//                                             endPoint: .bottomTrailing))
//                        .frame(width: 200, height: 200)
//                        .shadow(radius: 10)
//                }
//            }
//        }
//    }
//}
//
//struct ProfileView2: View {
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color.white.ignoresSafeArea()
//                VStack(spacing: 20) {
//                    Text("👤 Profile Screen")
//                        .font(.largeTitle)
//                        .fontWeight(.heavy)
//                        .foregroundColor(.pink)
//                    
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(LinearGradient(gradient: Gradient(colors: [.pink, .orange]),
//                                             startPoint: .topLeading,
//                                             endPoint: .bottomTrailing))
//                        .frame(width: 200, height: 200)
//                        .shadow(radius: 10)
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    FitTabView()
//}
//
//

//import SwiftUI
//
//struct FitTabView: View {
//    @State private var selectedTab = 0
//    
//    var body: some View {
//        ZStack {
//            LinearGradient(
//                gradient: Gradient(colors: [Color.purple.opacity(0.1), Color.blue.opacity(0.1)]),
//                startPoint: .top,
//                endPoint: .bottom
//            )
//            .ignoresSafeArea()
//            
//            TabView(selection: $selectedTab) {
//                
//                CombinedHomeView()
//                    .tabItem {
//                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
//                        Text("Home")
//                        
//                    }
//                    .tag(0)
//                
//                CombinedOfferGroupsView()
//                    .tabItem {
//                        Image(systemName: selectedTab == 1 ? "magnifyingglass.circle.fill" : "magnifyingglass.circle")
//                        Text("Chats & Groups")
//                    }
//                    .tag(1)
//                
//                NewView()
//                    .tabItem {
//                        Image(systemName: selectedTab == 2 ? "person.2.fill" : "person.2")
//                        Text("Get a Coach")
//                    }
//                    .tag(2)
//                
//                ExerciseVideoListView()
//                    .tabItem {
//                        Image(systemName: selectedTab == 3 ? "bell.fill" : "bell")
//                        Text("WVideos")
//                    }
//                    .tag(3)
//                
//                ToolsViews()
//                    .tabItem {
//                        Image(systemName: selectedTab == 4 ? "person.crop.circle.fill" : "person.crop.circle")
//                        Text("Tools")
//                    }
//                    .tag(4)
//            }
//            .accentColor(.purple)
//            .animation(.easeInOut(duration: 0.25), value: selectedTab)
//            .navigationBarBackButtonHidden(true)
//        }
//        .onAppear {
//            setupTabBarAppearance()
//        }
//    }
//    
//    // MARK: - UltraThin TabBar Background
//    private func setupTabBarAppearance() {
//        let appearance = UITabBarAppearance()
//        appearance.configureWithTransparentBackground() // 👈 Transparent background
//        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial) // 👈 UltraThin Blur
//        appearance.backgroundColor = UIColor.clear // 👈 Optional, clear color
//        
//        UITabBar.appearance().standardAppearance = appearance
//        UITabBar.appearance().scrollEdgeAppearance = appearance
//    }
//}
//
//#Preview {
//    FitTabView()
//}

import SwiftUI

struct FitTabView: View {
    @State private var selectedTab = 0
    @State private var showPopup = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.1), Color.blue.opacity(0.1)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            TabView(selection: $selectedTab) {
                CombinedHomeView()
                    .tabItem {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        Text("Home")
                    }
                    .tag(0)

                CombinedOfferGroupsView()
                    .tabItem {
                        Image(systemName: selectedTab == 1 ? "magnifyingglass.circle.fill" : "magnifyingglass.circle")
                        Text("Chats & Groups")
                    }
                    .tag(1)

                NewView()
                    .tabItem {
                        Image(systemName: selectedTab == 2 ? "person.2.fill" : "person.2")
                        Text("Get a Coach")
                    }
                    .tag(2)

                ExerciseVideoListView()
                    .tabItem {
                        Image(systemName: selectedTab == 3 ? "bell.fill" : "bell")
                        Text("WVideos")
                    }
                    .tag(3)

                ToolsViews()
                    .tabItem {
                        Image(systemName: selectedTab == 4 ? "person.crop.circle.fill" : "person.crop.circle")
                        Text("Tools")
                    }
                    .tag(4)
            }
            .accentColor(.purple)
            .animation(.easeInOut(duration: 0.25), value: selectedTab)
            .navigationBarBackButtonHidden(true)

            // ✅ Show popup only when on tab 0 (CombinedHomeView)
            if showPopup && selectedTab == 0 {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .transition(.opacity)
                    .onTapGesture {
                        withAnimation {
                            showPopup = false
                        }
                    }

                PopupCard(showPopup: $showPopup)
                    .transition(.scale)
                    .zIndex(1)
            }
        }
        .onAppear {
            setupTabBarAppearance()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.spring()) {
                    showPopup = true
                }
            }
        }
    }

    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        appearance.backgroundColor = UIColor.clear

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

#Preview {
    FitTabView()
}
