//
//  AdvertiementViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 07/07/25.
//

//ViewModel :- MVVVM.


import SwiftUI
class AdvertisementViewModel: ObservableObject {
    @Published var offset: CGFloat = UIScreen.main.bounds.width

    func startAnimation() {
        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
            offset = -UIScreen.main.bounds.width
        }
    }

    func resetAndStartAnimation() {
        offset = UIScreen.main.bounds.width
        startAnimation()
    }
}

