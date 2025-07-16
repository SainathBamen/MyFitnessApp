//
//  ClientsReviewView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 24/06/25.
//

import SwiftUI
// MARK: - View
struct ClientReviewHorizontalView: View {
    @StateObject private var viewModel = ClientReviewViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("🌟 Client Reviews")
                .font(.title.bold())
                .foregroundColor(.purple)
                .padding(.horizontal)
                .padding(.top, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.reviews) { review in
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 12) {
                            
                                Image(review.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                                    )
                                    .shadow(radius: 3)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(review.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    
                                    HStack(spacing: 2) {
                                        ForEach(0..<review.rating, id: \.self) { _ in
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                        }
                                    }
                                }
                            }
                            
                            // Review text
                            Text("“\(review.review)”")
                                .font(.body)
                                .foregroundColor(.gray)
                                .lineLimit(viewModel.expandedReviewIDs.contains(review.id) ? nil : 2)
                                .fixedSize(horizontal: false, vertical: true)
                                .onTapGesture {
                                    withAnimation {
                                        viewModel.toggleExpansion(for: review)
                                    }
                                }
                            
                            Text(viewModel.expandedReviewIDs.contains(review.id) ? "Show Less" : "Read More")
                                .font(.caption)
                                .foregroundColor(.blue)
                                .onTapGesture {
                                    withAnimation {
                                        viewModel.toggleExpansion(for: review)
                                    }
                                }
                        }
                        .padding()
                        .frame(width: 280)
                        .background(
                            LinearGradient(colors: [Color.white, Color.purple.opacity(0.05)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 3)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 20)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

// MARK: - Preview
#Preview {
    ClientReviewHorizontalView()
}
