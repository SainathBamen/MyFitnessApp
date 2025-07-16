//
//  SupplementShopModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 04/07/25.
//

import SwiftUI

// MARK: - Product Model
struct ShopProduct: Identifiable {
    var id: Int
    var name: String
    var price: Double
    var description: String
    var imageName: String
}

// MARK: - Cart Item Model
struct ShopCartItem: Identifiable {
    var id = UUID()
    var product: ShopProduct
    var quantity: Int
}

