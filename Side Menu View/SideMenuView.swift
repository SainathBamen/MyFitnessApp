////
////  SideMenu.swift
////  Fitness App In SwiftUI
////
////  Created by Sainath bamen on 09/05/25.
////
//
//import SwiftUI
//
//class SideMenuViewModel: ObservableObject {
//    @Published var showMenu: Bool = false
//
//    func toggleMenu() {
//        withAnimation {
//            showMenu.toggle()
//        }
//    }
//
//    func hideMenu() {
//        withAnimation {
//            showMenu = false
//        }
//    }
//}
//
//struct SimpleSideMenu: View {
//    @StateObject private var viewModel = SideMenuViewModel()
//
//    var body: some View {
//        ZStack(alignment: .leading) {
//            // Main content
//            VStack {
//                HStack {
//                    Button(action: {
//                        viewModel.toggleMenu()
//                    }) {
//                        Image(systemName: "line.horizontal.3")
//                            .font(.title)
//                            .foregroundColor(.black)
//                    }
//                    .padding()
//                    Spacer()
//                }
//                Spacer()
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.white)
//
//            // Dimmed background when menu shows
//            if viewModel.showMenu {
//                Color.blue.opacity(0.3)
//                    .ignoresSafeArea()
//                    .onTapGesture {
//                        viewModel.hideMenu()
//                    }
//            }
//
//            // Side Menu
//            if viewModel.showMenu {
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
//                    HStack{
//                        Image(systemName: "")
//                        Text("My Orders")
//                    }
//                    HStack{
//                        Image(systemName: "")
//                        Text("Challenges")
//                    }
//                    HStack{
//                        Image(systemName: "")
//                        Text("Referrel")
//                    }
//                    HStack{
//                        Image(systemName: "")
//                        Text("My Plans")
//                    }
//                    
//                    Spacer()
//                }
//                .padding(.top, 100)
//                .padding(.horizontal, 20)
//                .frame(width: 250)
//                .frame(maxHeight: .infinity)
//                .background(Color.blue.opacity(0.2))
//                .transition(.move(edge: .leading))
//                .gesture(
//                    DragGesture()
//                        .onEnded { value in
//                            if value.translation.width < -100 {
//                                viewModel.hideMenu()
//                            }
//                        }
//                )
//            }
//        }
//    }
//}
//
//#Preview {
//    SimpleSideMenu()
//}
