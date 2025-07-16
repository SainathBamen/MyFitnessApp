//
//  TrainerFollowViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 30/04/25.
//

import Foundation

class TrainerFollowViewModel: ObservableObject {
    @Published var suggestedUsers: [SuggestedUser] = [
        SuggestedUser(imageName: "trainer1", name: "Larry", subText: "Followed by yourfitnessstories"),
        SuggestedUser(imageName: "trainer2", name: "Tristyn Lee", subText: "Followed by yourfitnessstories"),
        SuggestedUser(imageName: "trainer3", name: "Sara Saffari", subText: "Followed by flex_with__rj"),
        SuggestedUser(imageName: "trainer4", name: "Ash", subText: "Popular"),
        SuggestedUser(imageName: "trainer5", name: "Larry", subText: "Popular"),
        SuggestedUser(imageName: "trainer6", name: "jackson", subText: "Popular"),
        SuggestedUser(imageName: "trainer7", name: "Oliver", subText: "Popular"),
        SuggestedUser(imageName: "trainer8", name: "Misty", subText: "Popular"),
        SuggestedUser(imageName: "trainer9", name: "Brock", subText: "Popular"),
        SuggestedUser(imageName: "trainer10", name: "Kinky", subText: "Popular"),
        SuggestedUser(imageName: "trainer11", name: "Sainath", subText: "Popular"),
        SuggestedUser(imageName: "trainer12", name: "Kriyu", subText: "Popular"),
        SuggestedUser(imageName: "trainer13", name: "Oscar", subText: "Popular"),
        SuggestedUser(imageName: "trainer14", name: "Drake", subText: "Popular"),
        SuggestedUser(imageName: "trainer15", name: "Parks", subText: "Popular")
    ]

    func shuffleSuggestions() {
        suggestedUsers.shuffle()
    }
}
