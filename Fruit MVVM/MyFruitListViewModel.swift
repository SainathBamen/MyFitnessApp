//
//  MyFruitListViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 25/06/25.
//

import Foundation
import SwiftUI

class MyFruitViewModel: ObservableObject {
    @Published var fruits: [MyFruits] = []

    init() {
        loadFruits()
    }

    func loadFruits() {
        fruits = DataLoader.loadFruits()
    }
}
