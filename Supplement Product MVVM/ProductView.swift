//
//  ProductView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 07/05/25.
//


import SwiftUI

struct ProductCartView: View {
    @StateObject var cartVM = CartViewModel()
    
    let products = [
        Product(id: 1, name: "Avvtaar Whey Protein", price: 2999, description: "Best quality isolate protein", imageName: "avvtaarImg"),
        Product(id: 2, name: "Gnc Creatine", price: 999, description: "Provides strength and energy", imageName: "gncImg"),
        
        Product(id: 3, name: "Multivitamin", price: 499, description: "Multivitamin & Minerals", imageName: "multiImg"),
        
        Product(id: 4, name: "On Bcaa", price: 999, description: "Provides essential amino acid", imageName: "bcaaImg"),
        Product(id: 5, name: "Glutamine", price: 899, description: "Glutamine is an α-amino acid that is used in the biosynthesis of proteins. Its side chain is similar to that of glutamic acid, except the carboxylic acid group is replaced by an amide", imageName: "glutaminImg")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    ScrollView {
                        ForEach(products) { product in
                            HStack(alignment: .top, spacing: 16) {
                                Image(product.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .shadow(radius: 4)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(product.name)
                                        .font(.headline)
                                    
                                    Text(product.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .lineLimit(2)
                                    
                                    Text("₹\(product.price, specifier: "%.2f")")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.green)
                                    
                                    HStack(spacing: 16) {
                                        Button {
                                            withAnimation { cartVM.decreaseQuantity(for: product) }
                                        } label: {
                                            Image(systemName: "minus.circle.fill")
                                                .font(.title2)
                                        }
                                        
                                        Text("\(cartVM.quantity(for: product))")
                                            .font(.title3)
                                            .frame(width: 35)
                                        
                                        Button {
                                            withAnimation { cartVM.increaseQuantity(for: product) }
                                        } label: {
                                            Image(systemName: "plus.circle.fill")
                                                .font(.title2)
                                        }
                                    }
                                    .foregroundColor(.blue)
                                    .padding(.top, 6)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(.ultraThinMaterial)
                                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 3)
                            )
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                        }
                    }
                    
                    VStack(spacing: 16) {
                        HStack {
                            Text("Total")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer()
                            Text("₹\(cartVM.totalPrice, specifier: "%.2f")")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                        
                        Button {
                            // place order action
                        } label: {
                            Text("Place Order")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    LinearGradient(colors: [Color.blue, Color.purple], startPoint: .leading, endPoint: .trailing)
                                )
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(color: .blue.opacity(0.3), radius: 5, x: 0, y: 3)
                        }
                    }
                    .padding()
                    .background(
                        BlurView(style: .systemThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            .shadow(color: .black.opacity(0.06), radius: 10, x: 0, y: -3)
                    )
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                }
                .background(
                    LinearGradient(
                        colors: [
                            Color(.systemGray6),
                            Color(.systemGray6).opacity(0.1) // 👈 Yaha control kar
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                )

                .navigationTitle("🛒 My Cart")
            }
        }
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview {
    ProductCartView()
}
