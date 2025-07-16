//
//  OfferSlidingView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 07/06/25.
//

import SwiftUI

struct OfferSlidingView: View {
    @StateObject private var viewModel = OfferSlidingViewModel()
    
    var body: some View {
        VStack {
            // Image Carousel
            TabView(selection: $viewModel.currentIndex) {
                ForEach(0..<viewModel.images.count, id: \.self) { index in
                    Image(viewModel.images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width * 0.85, height: 180)
                        .cornerRadius(20)
                        .clipped()
                        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
                        .padding(.horizontal, 10)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 240)
            .animation(.easeInOut, value: viewModel.currentIndex)

            // Custom Dots Indicator
            HStack(spacing: 8) {
                ForEach(0..<viewModel.images.count, id: \.self) { index in
                    Circle()
                        .fill(index == viewModel.currentIndex ? Color.blue : Color.gray.opacity(0.5))
                        .frame(width: index == viewModel.currentIndex ? 12 : 8, height: index == viewModel.currentIndex ? 12 : 8)
                        .scaleEffect(index == viewModel.currentIndex ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 0.25), value: viewModel.currentIndex)
                        .onTapGesture {
                            withAnimation {
                                viewModel.currentIndex = index
                            }
                        }
                }
            }
            .padding(.top, 6)
        }
        .background(Color(.white))
        .cornerRadius(20)
        .padding(.horizontal) // optional: only horizontal padding, no vertical
        .onDisappear {
            viewModel.stopTimer()
        }
    }
}


#Preview{
    OfferSlidingView()
}
