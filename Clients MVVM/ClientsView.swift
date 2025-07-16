//
//  ClientsView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 03/04/25.
//

//import SwiftUI
//
//struct ClientsView: View {
//    //MARK: - Created ViewModel.
//    @StateObject private var viewModel = ClientsProfileViewModel()
//    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 20) {
//                
//                // Title
//                Text("Our Clients")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.horizontal)
//                    .padding(.top, 10)
//                
//                // Client transformations
//                ForEach(viewModel.posts) { client in
//                    ClientsTransformation(post: client)
//                        .padding()
//                        .background(Color(.systemGray6))
//                        .cornerRadius(16)
//                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
//                }
//            }
//            .padding(.bottom)
//        }
//    }
//}
//
//struct ClientsTransformation: View {
//    let post: ClientsProfileModel
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            
//            // Profile section
//            HStack(spacing: 12) {
//                Image(post.profileImage)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 55, height: 55)
//                    .clipShape(Circle())
//                
//                VStack(alignment: .leading, spacing: 4) {
//                    Text(post.username)
//                        .font(.headline)
//                    Text("Coach: \(post.coachName)")
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                }
//            }
//            
//            // Before/After label
//            HStack {
//                Text("Before")
//                Spacer()
//                Text("After")
//            }
//            .font(.caption)
//            .foregroundColor(.gray)
//            
//            // Before/After image
//            Image(post.beforeAfterImage)
//                .resizable()
//                .scaledToFit()
//                .frame(height: 370)
//                .cornerRadius(12)
//        }
//        .background(Color(.gray))
//    }
//}
//
//#Preview {
//    ClientsView()
//}


//import SwiftUI
//
//struct ClientsView: View {
//    @StateObject private var viewModel = ClientsProfileViewModel()
//    
//    var body: some View {
//        ZStack {
//            GradientBackgroundView()
//            ScrollView {
//                VStack(alignment: .leading, spacing: 24) {
//                    
//                    // Title
//                    Text("Our Clients")
//                        .font(.title)
//                        .fontWeight(.heavy)
//                        .padding(.horizontal)
//                        .padding(.top, 20)
//                        .foregroundColor(.primary)
//                    
//                    // Client cards
//                    ForEach(viewModel.posts) { client in
//                        ClientsTransformation(post: client)
//                            .padding()
//                            .background(
//                                RoundedRectangle(cornerRadius: 20)
//                                    .fill(Color(UIColor.systemBackground))
//                                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
//                            )
//                            .padding(.horizontal)
//                    }
//                }
//                .padding(.bottom, 40)
//            }
//        }
//    }
//}
//
//struct ClientsTransformation: View {
//    let post: ClientsProfileModel
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            
//            // Profile info
//            HStack(spacing: 16) {
//                Image(post.profileImage)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 60, height: 60)
//                    .clipShape(Circle())
//                    .shadow(radius: 4)
//                
//                VStack(alignment: .leading, spacing: 6) {
//                    Text(post.username)
//                        .font(.title3)
//                        .fontWeight(.semibold)
//                    Text("Coach: \(post.coachName)")
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                }
//                
//                Spacer()
//            }
//            
//            // Before / After labels with line separator
//            HStack {
//                Text("Before")
//                    .font(.caption2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.gray)
//                
//                Spacer()
//                
//                Text("After")
//                    .font(.caption2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.gray)
//            }
//            
//            // Before/After Image
//            Image(post.beforeAfterImage)
//                .resizable()
//                .scaledToFit()
//                .frame(maxHeight: 370)
//                .clipShape(RoundedRectangle(cornerRadius: 16))
//                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 6)
//        }
//        .padding()
//        .background(
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color(UIColor.systemGray6))
//        )
//    }
//}
//
//#Preview {
//    ClientsView()
//}
//


import SwiftUI

struct ClientsTransformation: View {
    let post: ClientsProfileModel

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {

            // Profile Info
            HStack(spacing: 16) {
                Image(post.profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .shadow(radius: 4)

                VStack(alignment: .leading, spacing: 6) {
                    Text(post.username)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Coach: \(post.coachName)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }

            // Before / After labels
            HStack {
                Text("Before")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Spacer()
                Text("After")
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }

            // Before/After Image
            Image(post.beforeAfterImage)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 370)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 6)

            // Action Buttons: Like, Comment, Share | Ellipsis
            HStack {
                HStack(spacing: 30) {
                    Button { print("Liked ❤️") } label: {
                        Image(systemName: "heart")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 22))
                    }

                    Button { print("Comment tapped 💬") } label: {
                        Image(systemName: "bubble.right")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 22))
                    }

                    Button { print("Share tapped 📤") } label: {
                        Image(systemName: "paperplane")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 22))
                    }
                }

                Spacer()

                Button { print("More options tapped") } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .font(.system(size: 20))
                        .foregroundColor(.primary)
                }
            }
            .padding(.top, 5)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(UIColor.systemGray6))
        )
    }
}


// MARK: - All Clients List View
struct ClientsView: View {
    @StateObject private var viewModel = ClientsProfileViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Title
                Text("Our Clients")
                    .font(.largeTitle.bold())
                    .padding(.top, 30)
                    .padding(.horizontal)
                
                // All clients' cards
                ForEach(viewModel.posts) { client in
                    ClientsTransformation(post: client)
                        .padding(.horizontal)
                }
            }
            .padding(.bottom, 50)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

// MARK: - Preview
#Preview {
    ClientsView()
}
