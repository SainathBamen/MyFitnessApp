//
//  CompleteApp.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 05/06/25.
//


//import SwiftUI
//
//struct CombinedHomeView: View {
//    @StateObject private var sideMenuVM = SideMenuViewModel()
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//            VStack(spacing: 0) {
//                // Top Menu Button
//                HStack {
//                    Button(action: {
//                        sideMenuVM.toggleMenu()
//                    }) {
//                        Image(systemName: "line.horizontal.3")
//                            .font(.title)
//                            .foregroundColor(.black)
//                    }
//                    .padding()
//                    Spacer()
//                }
//                .padding(.top, 50)
//
//                // Second View Yaha Load hoga
//                UserListView()
//
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.white)
//            .offset(x: sideMenuVM.showMenu ? UIScreen.main.bounds.width * 0.6 : 0)
//            .animation(.easeInOut, value: sideMenuVM.showMenu)
//
//            // Dimmed Background
//            if sideMenuVM.showMenu {
//                Color.black.opacity(0.3)
//                    .ignoresSafeArea()
//                    .onTapGesture {
//                        sideMenuVM.hideMenu()
//                    }
//            }
//
//            // Side Menu
//            if sideMenuVM.showMenu {
//                VStack(alignment: .leading, spacing: 30) {
//                    HStack {
//                        Image(systemName: "person.circle")
//                        Text("Profile")
//                    }
//                    HStack {
//                        Image(systemName: "envelope")
//                        Text("Messages")
//                    }
//                    HStack {
//                        Image(systemName: "gear")
//                        Text("Settings")
//                    }
//                    Spacer()
//                }
//                .padding(.top, 100)
//                .padding(.horizontal, 20)
//                .frame(width: 250)
//                .frame(maxHeight: .infinity)
//                .background(Color.gray.opacity(0.95))
//                .transition(.move(edge: .leading))
//                .gesture(
//                    DragGesture()
//                        .onEnded { value in
//                            if value.translation.width < -100 {
//                                sideMenuVM.hideMenu()
//                            }
//                        }
//                )
//            }
//        }
//        .ignoresSafeArea()
//    }
//}
//
//#Preview {
//    CombinedHomeView()
//}

//import SwiftUI
//
//struct CombinedHomeView: View {
//    @StateObject private var sideMenuVM = SideMenuViewModel()
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//            VStack(spacing: 0) {
//                // Top Menu Bar
//                HStack {
//                    // Side Menu Button
//                    Button(action: {
//                        sideMenuVM.toggleMenu()
//                    }) {
//                        Image(systemName: "line.horizontal.3")
//                            .font(.title)
//                            .foregroundColor(.black)
//                    }
//                    .padding(.leading)
//
//                    Spacer()
//
//                    // Right Side Round Button
//                    Button(action: {
//                        print("Right button tapped")
//                    }) {
//                        Image(systemName: "bell")
//                            .font(.system(size: 24)) // yahan size set karo
//
//                            .foregroundColor(.black)
//                            .padding()
//                            .background(Color.white)
//                            .clipShape(Circle())
//                    }
//                    .padding(.trailing)
//                }
//                .padding(.top, 50)
//
//                // Scrollable content: UserListView + ClientsView
//                ScrollView {
//                    VStack(alignment: .leading, spacing: 20) {
//                        // UserListView
//                        UserListView()
//
//                        // ClientsView
//                        ClientsView()
//                    }
//                    .padding(.top, 10)
//                }
//
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.white)
//            .offset(x: sideMenuVM.showMenu ? UIScreen.main.bounds.width * 0.6 : 0)
//            .animation(.easeInOut, value: sideMenuVM.showMenu)
//
//            // Dimmed Background
//            if sideMenuVM.showMenu {
//                Color.black.opacity(0.3)
//                    .ignoresSafeArea()
//                    .onTapGesture {
//                        sideMenuVM.hideMenu()
//                    }
//            }
//
//            // Side Menu
//            if sideMenuVM.showMenu {
//                VStack(alignment: .leading, spacing: 30) {
//                    HStack {
//                        Image(systemName: "person.circle")
//                        Text("Profile")
//                    }
//                    HStack {
//                        Image(systemName: "envelope")
//                        Text("Messages")
//                    }
//                    HStack {
//                        Image(systemName: "gear")
//                        Text("Settings")
//                    }
//                    Spacer()
//                }
//                .padding(.top, 100)
//                .padding(.horizontal, 20)
//                .frame(width: 250)
//                .frame(maxHeight: .infinity)
//                .background(Color.gray.opacity(0.95))
//                .transition(.move(edge: .leading))
//                .gesture(
//                    DragGesture()
//                        .onEnded { value in
//                            if value.translation.width < -100 {
//                                sideMenuVM.hideMenu()
//                            }
//                        }
//                )
//            }
//        }
//        .ignoresSafeArea()
//    }
//}
//
//#Preview {
//    CombinedHomeView()
//}
//

import SwiftUI

struct CombinedHomeView: View {
    @StateObject private var sideMenuVM = SideMenuViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .leading) {
                VStack(spacing: 0) {
                    // Top Bar
                    HStack {
                        Button(action: {
                            sideMenuVM.toggleMenu()
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.black)
                                .padding(10)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        
                        Spacer()
                        
                        Text("🏋️‍♂️ FitZone")
                            .font(.largeTitle.bold())
                            .foregroundStyle(
                                LinearGradient(colors: [.purple, .blue],
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                            )
                        
                        Spacer()
                        
                        Button(action: {
                            print("Bell tapped")
                        }) {
                            Image(systemName: "bell.fill")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.blue)
                                .padding(10)
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 55)
                    .padding(.bottom, 12)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 30) {
                            UserListView()
                                .padding(.horizontal)
                            
                            ClientsView()
                                .padding(.horizontal)
                        }
                        .padding(.top, 20)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    LinearGradient(colors: [Color(.systemGray6), Color.white],
                                   startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                )
                .offset(x: sideMenuVM.showMenu ? UIScreen.main.bounds.width * 0.65 : 0)
                .animation(.easeInOut, value: sideMenuVM.showMenu)
                
                if sideMenuVM.showMenu {
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            sideMenuVM.hideMenu()
                        }
                }
                
                if sideMenuVM.showMenu {
                    VStack(alignment: .leading, spacing: 28) {
                        HStack(spacing: 16) {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 28))
                                .foregroundColor(.white)
                            Text("Profile")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        HStack(spacing: 16) {
                            Image(systemName: "envelope.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                            Text("Messages")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        HStack(spacing: 16) {
                            Image(systemName: "bell.badge.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                            Text("Notifications")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        HStack(spacing: 16) {
                            Image(systemName: "chart.bar.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                            Text("Progress")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        HStack(spacing: 16) {
                            Image(systemName: "creditcard.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                            Text("Subscriptions")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        NavigationLink(destination: SettingView()) {
                            HStack(spacing: 16) {
                                Image(systemName: "gearshape.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                Text("Settings")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        HStack(spacing: 16) {
                            Image(systemName: "questionmark.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                            Text("Help Center")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        HStack(spacing: 16) {
                            Image(systemName: "arrow.backward.square.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                            Text("Logout")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 120)
                    .padding(.horizontal, 20)
                    .frame(width: 260)
                    .frame(maxHeight: .infinity)
                    .background(
                        LinearGradient(colors: [.purple.opacity(0.3), .blue.opacity(0.3)],
                                       startPoint: .topLeading, endPoint: .bottomTrailing)
                            .ignoresSafeArea()
                    )
                    .transition(.move(edge: .leading))
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                if value.translation.width < -100 {
                                    sideMenuVM.hideMenu()
                                }
                            }
                    )
                }
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    CombinedHomeView()
}
