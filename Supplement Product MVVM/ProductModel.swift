//
//  ProductModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 07/05/25.
//

import SwiftUI

struct Product: Identifiable {
    var id: Int
    var name: String
    var price: Double
    var description: String
    var imageName: String
}

struct CartItem: Identifiable {
    var id = UUID()
    var product: Product
    var quantity: Int
}
