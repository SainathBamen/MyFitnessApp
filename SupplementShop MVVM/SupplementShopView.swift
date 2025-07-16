//
//  SupplementShopView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 04/07/25.
//
import SwiftUI

// MARK: - Product Cart View
struct SupplementShopView: View {
    @StateObject var cartVM = CartViewModel()
    @State private var showOrderAlert = false
    
    let products = [
        Product(id: 1, name: "Whey Protein", price: 2999, description: "High-quality protein for muscle recovery", imageName: "WheyImg"),
        Product(id: 2, name: "Creatine Monohydrate", price: 1299, description: "Boosts strength and muscle volume", imageName: "Creatine"),
        Product(id: 3, name: "BCAA", price: 1799, description: "Supports muscle recovery and endurance", imageName: "bcaaImg"),
        Product(id: 4, name: "Multivitamins", price: 899, description: "Daily essential vitamins and minerals", imageName: "supplementImg"),
        Product(id: 5, name: "Pre-Workout", price: 1499, description: "Enhances energy and focus for workouts", imageName: "preworkoutImg")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(products) { product in
                        HStack(spacing: 12) {
                            Image(product.imageName)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .background(Color.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                            VStack(alignment: .leading, spacing: 4) {
                                Text(product.name)
                                    .font(.headline)
                                
                                Text(product.description)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Text("₹\(product.price, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                                
                                HStack {
                                    Button {
                                        cartVM.decreaseQuantity(for: product)
                                    } label: {
                                        Image(systemName: "minus.circle.fill")
                                    }
                                    
                                    Text("\(cartVM.quantity(for: product))")
                                        .frame(width: 30)
                                    
                                    Button {
                                        cartVM.increaseQuantity(for: product)
                                    } label: {
                                        Image(systemName: "plus.circle.fill")
                                    }
                                }
                                .foregroundColor(.blue)
                                .padding(.top, 4)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                }
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Total")
                            .font(.title3)
                        Spacer()
                        Text("₹\(cartVM.totalPrice, specifier: "%.2f")")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    
                    Button("Place Order") {
                        showOrderAlert = true
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: -2)
            }
            .background(Color(.systemGray6).ignoresSafeArea())
            .navigationTitle("Supplement Shop")
            .alert(isPresented: $showOrderAlert) {
                Alert(
                    title: Text("Order Placed!"),
                    message: Text("Your supplement order has been placed successfully 💪"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

// MARK: - Preview



#Preview {
    SupplementShopView()
}
