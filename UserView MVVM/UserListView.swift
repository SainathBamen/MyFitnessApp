//
//  UserListView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 31/03/25.
//

//import SwiftUI
//
//struct UserListView: View {
//    @StateObject private var viewModel = UserViewModel()
//
//    var body: some View {
//        
//            VStack {
//                if viewModel.isLoading {
//                    ProgressView("Loading...")
//                } else if let errorMessage = viewModel.errorMessage {
//                    Text(errorMessage)
//                        .foregroundColor(.red)
//                        .padding()
//                } else {
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        LazyHStack(spacing: 10) {
//                            ForEach(viewModel.users, id: \.id) { user in
//                                VStack {
//                                    AsyncImage(url: URL(string: user.avatar)) { image in
//                                        image.resizable()
//                                    } placeholder: {
//                                        ProgressView()
//                                    }
//                                    .frame(width: 50, height: 50)
//                                    .clipShape(Circle())
//                                    
//                                    Text("\(user.firstName) \(user.lastName)")
//                                        .font(.headline)
//                                    Spacer()
//                                }
//                                .padding(5)
//                                
//                            }
//                        }
//
//                    }
//                }
//            }
//            
//            .navigationTitle("Our Trainers")
//            .task {
//                await viewModel.fetchUsers()
//            }
//            
//        }
//        
//        
//        
//    }
//
//
//#Preview {
//    UserListView()
//}
//
//
//import SwiftUI
//
//struct UserListView: View {
//    @StateObject private var viewModel = UserViewModel()
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            Text("Users")
//                .font(.title2)
//                .fontWeight(.bold)
//                .padding(.horizontal)
//
//            if viewModel.isLoading {
//                ProgressView("Loading...")
//                    .frame(maxWidth: .infinity, alignment: .center)
//            } else {
//                ScrollView(.horizontal, showsIndicators: false) {
//                    LazyHStack(spacing: 12) {
//                        ForEach(viewModel.users, id: \.id) { user in
//                            UserCardView(user: user)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//            }
//
//            Spacer()
//        }
//        .padding(.top, 12)
//        .background(Color(.systemBackground))
//        .task {
//            await viewModel.fetchUsers()
//        }
//    }
//}
//
//struct UserCardView: View {
//    let user: Datum
//
//    var body: some View {
//        VStack(spacing: 8) {
//            AsyncImage(url: URL(string: user.avatar)) { image in
//                image
//                    .resizable()
//                    .scaledToFill()
//            } placeholder: {
//                ProgressView()
//            }
//            .frame(width: 60, height: 60)
//            .clipShape(Circle())
//            .shadow(radius: 3)
//
//            Text("\(user.firstName) \(user.lastName)")
//                .font(.footnote)
//                .fontWeight(.medium)
//                .multilineTextAlignment(.center)
//                .frame(width: 70)
//        }
//        .padding(8)
//        .background(Color(.systemGray6))
//        .cornerRadius(12)
//    }
//}
//
//#Preview {
//    UserListView()
//}
//
//





import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Safe top padding
                    Spacer().frame(height: 40)
                    
                    Text("Our Trainers")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 20)
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 12) {
                                ForEach(viewModel.users, id: \.id) { user in
                                    UserCardView(user: user)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
//            .background(Color(.systemBackground))
//            .ignoresSafeArea(.all, edges: .bottom) // sirf bottom ignore, top ka humne manually handle kiya
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}

struct UserCardView: View {
    let user: Datum

    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .shadow(radius: 3)

            Text("\(user.firstName) \(user.lastName)")
                .font(.footnote)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .frame(width: 70)
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

#Preview {
    UserListView()
}


