//
//  CardSlidingViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 13/06/25.
//

import SwiftUI
import Combine

class CartSlidingViewModel: ObservableObject {
    @Published var currentIndex = 0

    let images = [
        "Creatine",
        "WheyImg",
        "WheyImg2",
        "GlutamineImg"
    ]

    private var cancellable: AnyCancellable?

    init() {
        startTimer()
    }

    func startTimer() {
        cancellable = Timer.publish(every: 3, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                withAnimation {
                    self.currentIndex = (self.currentIndex + 1) % self.images.count
                }
            }
    }

    func stopTimer() {
        cancellable?.cancel()
    }

    deinit {
        stopTimer()
    }
}
