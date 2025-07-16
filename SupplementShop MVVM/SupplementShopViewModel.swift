//
//  SupplementShopViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 04/07/25.
//

import SwiftUI

// MARK: - Cart View Model
class ShopCartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    func addToCart(product: Product) {
        // Check kar ki product cart me pehle se hai kya
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }

    }

    
    func increaseQuantity(for product: Product) {
        addToCart(product: product)
    }
    
    func decreaseQuantity(for product: Product) {
        guard let index = cartItems.firstIndex(where: { $0.product.id == product.id }) else { return }
        cartItems[index].quantity -= 1
        if cartItems[index].quantity == 0 {
            cartItems.remove(at: index)
        }
    }
    
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
    
    func quantity(for product: Product) -> Int {
        cartItems.first(where: { $0.product.id == product.id })?.quantity ?? 0
    }
}

