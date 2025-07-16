//
//  NonVegProteinModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 02/04/25.
//

import Foundation
import SwiftUI

struct FoodItem: Identifiable {
    var id = UUID()
    var name: String
    var calories: Int
    var protein: Int
    var fat: Int
    var carbs: Int
    var VegProteinImage: String
}

