//
//  finalView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 06/06/25.
//

import SwiftUI

class SideMenuViewModel: ObservableObject {
    @Published var showMenu: Bool = false

    func toggleMenu() {
        withAnimation {
            showMenu.toggle()
        }
    }

    func hideMenu() {
        withAnimation {
            showMenu = false
        }
    }
}


struct CombinedHomeView2: View {
    @StateObject private var sideMenuVM = SideMenuViewModel()

    var body: some View {
        ZStack(alignment: .leading) {
            VStack(spacing: 0) {
                // Top Menu Bar
                HStack {
                    // Side Menu Button
                    Button(action: {
                        sideMenuVM.toggleMenu()
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    .padding(.leading)

                    Spacer()

                    // Right Side Round Button
                    Button(action: {
                        print("Right button tapped")
                    }) {
                        Image(systemName: "bell")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.purple)
                            .clipShape(Circle())
                    }
                    .padding(.trailing)
                }
                .padding(.top, 50)

                // Scrollable content: UserListView + ClientsView
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // UserListView
                        UserListView()

                        // ClientsView
                        ClientsView()
                    }
                    .padding(.top, 10)
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .offset(x: sideMenuVM.showMenu ? UIScreen.main.bounds.width * 0.6 : 0)
            .animation(.easeInOut, value: sideMenuVM.showMenu)

            // Dimmed Background
            if sideMenuVM.showMenu {
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        sideMenuVM.hideMenu()
                    }
            }

            // Side Menu (from SimpleSideMenu)
            if sideMenuVM.showMenu {
                VStack(alignment: .leading, spacing: 30) {
                    HStack {
                        Image(systemName: "person.circle")
                        Text("Profile")
                    }
                    HStack {
                        Image(systemName: "envelope")
                        Text("Messages")
                    }
                    HStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    HStack {
                        Image(systemName: "cart")
                        Text("My Orders")
                    }
                    HStack {
                        Image(systemName: "flame")
                        Text("Challenges")
                    }
                    HStack {
                        Image(systemName: "gift")
                        Text("Referral")
                    }
                    HStack {
                        Image(systemName: "doc.text")
                        Text("My Plans")
                    }
                    Spacer()
                }
                .padding(.top, 100)
                .padding(.horizontal, 20)
                .frame(width: 250)
                .frame(maxHeight: .infinity)
                .background(Color.blue.opacity(0.2))
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

#Preview {
    CombinedHomeView2()
}
