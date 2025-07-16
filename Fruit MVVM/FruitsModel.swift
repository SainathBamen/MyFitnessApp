//
//  FruitsModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 02/04/25.
//

import Foundation

//struct Fruit: Identifiable {
//    let id = UUID()
//    let name: String
//    let calories: Int
//    let carbohydrates: Double
//    let protein: Double
//    let fat: Double
//    let vitamins: String
//    let fruitImg: String
//    
//    var description: String {
//        """
//        \(name) is a delicious fruit with approximately \(calories) calories per 100g.
//        It contains \(carbohydrates)g of carbohydrates, \(protein)g of protein, and \(fat)g of fat.
//        It is rich in \(vitamins).
//        """
//    }
//    
//    var shortDescription: String {
//        "\(name) has \(calories) calories, \(carbohydrates)g carbs, \(protein)g protein, \(fat)g fat."
//    }
//}

import Foundation

struct MyFruits: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let fruitImg: String
}

