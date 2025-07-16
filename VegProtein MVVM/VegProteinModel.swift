//
//  VegProteinModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 02/04/25.
//

import Foundation

struct ProteinRichFood: Identifiable {
       let id = UUID()
       let name: String
       let calories: Int
       let protein: Double
       let carbohydrates: Double
       let fat: Double
       let vitamins: String
       let imageName: String
    
    var description: String {
        """
        \(name) is a protein-rich food with approximately \(calories) calories per 100g.
        It contains \(protein)g of protein, \(carbohydrates)g of carbohydrates, and \(fat)g of fat.
        It is rich in \(vitamins).
        """
    }
}
