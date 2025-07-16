//
//  GroupViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 28/04/25.
//

import Foundation

// MARK: - ViewModel
class GroupsViewModel: ObservableObject {
    @Published var groups: [Group2] = [
        Group2(id: 1, name: "Fitness Freaks", location: "Pune", imageName: "canadaImg", isPaid: true, members: 12, isFull: false),
        Group2(id: 2, name: "Health Buddies", location: "Mumbai", imageName: "mumbaiImg", isPaid: false, members: 18, isFull: false),
        Group2(id: 3, name: "Weight Warriors", location: "Nagpur", imageName: "mumbaiImg", isPaid: true, members: 20, isFull: true),
        Group2(id: 4, name: "Body Builders", location: "Nashik", imageName: "rajImg", isPaid: false, members: 25, isFull: false),
        Group2(id: 5, name: "Muscle Factory", location: "Solapur", imageName: "canadaImg", isPaid: true, members: 15, isFull: false),
        Group2(id: 6, name: "Cardio Champs", location: "Kolhapur", imageName: "canadaImg", isPaid: false, members: 22, isFull: false),
        Group2(id: 7, name: "Muscle Factory", location: "Solapur", imageName: "canadaImg", isPaid: true, members: 15, isFull: false),
        
        Group2(id: 1, name: "Fitness Freaks", location: "Pune", imageName: "canadaImg", isPaid: true, members: 12, isFull: false),
    
        
        Group2(id: 9, name: "Cardio Champs", location: "Kolhapur", imageName: "canadaImg", isPaid: false, members: 22, isFull: false),
        
        Group2(id: 10, name: "Cardio Champs", location: "Kolhapur", imageName: "canadaImg", isPaid: false, members: 22, isFull: false)
    ]
}
