//
//  ClientReviewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 24/06/25.
//

import SwiftUI

// MARK: - Model
struct ClientReview: Identifiable {
    let id = UUID()
    let name: String
    let review: String
    let rating: Int
    let imageName: String
}

