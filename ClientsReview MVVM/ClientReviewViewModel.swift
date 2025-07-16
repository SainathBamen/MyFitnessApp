//
//  ClientReviewViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 24/06/25.
//

import SwiftUI

// MARK: - ViewModel
class ClientReviewViewModel: ObservableObject {
    @Published var reviews: [ClientReview] = [
        ClientReview(name: "Rahul Sathe", review: "Great trainer and awesome sessions. Highly recommended! I lost weight and gained confidence.", rating: 5, imageName: "trainer15"),
        ClientReview(name: "Priya Kolhe", review: "Workout plans are very effective. Trainer is super motivating and caring.", rating: 4, imageName: "trainer14"),
        ClientReview(name: "Raj Khatke", review: "Helped me lose 5kg in 2 months. Thank you for your guidance.", rating: 5, imageName: "trainer13"),
        ClientReview(name: "Neha Desai", review: "Very professional and supportive trainer. Regular check-ins and great energy.", rating: 4, imageName: "trainer12")
    ]
    
    @Published var expandedReviewIDs: Set<UUID> = []
    
    func toggleExpansion(for review: ClientReview) {
        if expandedReviewIDs.contains(review.id) {
            expandedReviewIDs.remove(review.id)
        } else {
            expandedReviewIDs.insert(review.id)
        }
    }
}
