//
//  OfferSlidingViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 07/06/25.
//

import SwiftUI
import Combine

class OfferSlidingViewModel: ObservableObject {
    @Published var currentIndex: Int = 0
    
    let images = [
        "Fittr1",
        "Fittr2",
        "Fittr3",
        "Fittr4"
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
}
