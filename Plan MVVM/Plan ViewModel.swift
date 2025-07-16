//
//  Plan ViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 04/04/25.
//

import SwiftUI

class PlanViewModel: ObservableObject {
    @Published var selectedIndex: Int? = 0

    let buttons: [PlanItem] = [
        PlanItem(title: "Get A Coach", systemImage: "star.fill", badge: nil),
        PlanItem(title: "My Health", systemImage: "heart.fill", badge: "NEW"),
        PlanItem(title: "My Plan", systemImage: "doc.fill", badge: "FREE"),
        PlanItem(title: "Fitshop", systemImage: "bag.fill", badge: nil),
        PlanItem(title: "Workout", systemImage: "flame.fill", badge: nil),
        PlanItem(title: "Nutrition", systemImage: "leaf.fill", badge: nil)
    ]
}
