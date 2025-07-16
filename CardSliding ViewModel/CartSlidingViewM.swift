//
//  CartSlidingViewM.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 13/06/25.
//
import SwiftUI

struct CartSlidingView: View {
    @StateObject private var viewModel = CartSlidingViewModel()

    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()

            VStack(spacing: 0) {
                // Image Carousel
                TabView(selection: $viewModel.currentIndex) {
                    ForEach(0..<viewModel.images.count, id: \.self) { index in
                        Image(viewModel.images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            .clipped()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 250)
                .animation(.easeInOut, value: viewModel.currentIndex)

                // Dots Indicator
                HStack(spacing: 8) {
                    ForEach(0..<viewModel.images.count, id: \.self) { index in
                        Circle()
                            .fill(index == viewModel.currentIndex ? Color.blue : Color.white.opacity(0.4))
                            .frame(width: index == viewModel.currentIndex ? 12 : 8, height: index == viewModel.currentIndex ? 12 : 8)
                            .scaleEffect(index == viewModel.currentIndex ? 1.2 : 1.0)
                            .animation(.easeInOut(duration: 0.3), value: viewModel.currentIndex)
                            .onTapGesture {
                                withAnimation {
                                    viewModel.currentIndex = index
                                }
                            }
                    }
                }
                .padding(.top, 12)

                Spacer()
            }
        }
    }
}

#Preview {
    CartSlidingView()
}
