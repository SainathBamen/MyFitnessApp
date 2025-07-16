

//
//  TrainerFollowView.swift
//  Reminder App In SwiftUI
//
//  Created by Sainath bamen on 24/04/25.
//


//Mvvm Completed.

//import SwiftUI
//
//struct TrainerFollowView: View {
//    @StateObject private var viewModel = TrainerFollowViewModel()
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//                    
//                    Text("Suggested for you")
//                        .font(.title3)
//                        .fontWeight(.bold)
//                        .padding(.horizontal)
//                        .padding(.top, 12)
//
//                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
//                        ForEach(viewModel.suggestedUsers) { user in
//                            VStack(spacing: 10) {
//                                Image(user.imageName)
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 80, height: 80)
//                                    .clipShape(Circle())
//                                    .padding(.top, 8)
//
//                                Text(user.name)
//                                    .font(.headline)
//
//                                Text(user.subText)
//                                    .font(.caption)
//                                    .foregroundColor(.gray)
//                                    .multilineTextAlignment(.center)
//                                    .lineLimit(1)
//                                    .padding(.horizontal, 6)
//
//                                Button(action: {}) {
//                                    Text("Follow")
//                                        .font(.system(size: 14, weight: .medium))
//                                        .frame(maxWidth: .infinity)
//                                        .padding(.vertical, 8)
//                                        .background(Color.blue)
//                                        .foregroundColor(.white)
//                                        .cornerRadius(8)
//                                }
//                                .padding(.horizontal, 10)
//                                .padding(.bottom, 10)
//                            }
//                            .background(Color(.systemGray6))
//                            .cornerRadius(16)
//                            .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
//                        }
//                    }
//                    .padding(.horizontal)
//
//                    Button(action: {
//                        viewModel.shuffleSuggestions()
//                    }) {
//                        Text("Shuffle Suggestions")
//                            .font(.system(size: 15, weight: .medium))
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.gray.opacity(0.15))
//                            .foregroundColor(.black)
//                            .cornerRadius(12)
//                    }
//                    .padding(.horizontal)
//                    .padding(.bottom, 20)
//                }
//            }
//            .background(Color(.systemGroupedBackground).ignoresSafeArea())
////            .navigationTitle("Trainers")
//        }
//    }
//}
//
//#Preview {
//    TrainerFollowView()
//}

import SwiftUI

struct TrainerFollowView: View {
    @StateObject private var viewModel = TrainerFollowViewModel()

    var body: some View {
        ScrollView {   // 👈 ScrollView lagaya
            VStack(alignment: .leading, spacing: 20) {
                Text("Suggested for you")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.top, 12)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(viewModel.suggestedUsers) { user in
                        VStack(spacing: 10) {
                            Image(user.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.top, 8)

                            Text(user.name)
                                .font(.headline)

                            Text(user.subText)
                                .font(.caption)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .lineLimit(1)
                                .padding(.horizontal, 6)

                            Button(action: {}) {
                                Text("Follow")
                                    .font(.system(size: 14, weight: .medium))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            .padding(.horizontal, 10)
                            .padding(.bottom, 10)
                        }
                        .background(Color(.systemGray6))
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
                    }
                }
                .padding(.horizontal)

                Button(action: {
                    viewModel.shuffleSuggestions()
                }) {
                    Text("Shuffle Suggestions")
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.15))
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
                .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    TrainerFollowView()
}
