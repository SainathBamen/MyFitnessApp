//
//  LottieView2.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 03/07/25.
//

import SwiftUI
import Lottie

struct LottieView2: UIViewRepresentable {
    let animationName: String

    init(animationName: String = "Animation - 1751453457632") {
        self.animationName = animationName
    }

    func makeUIView(context: Context) -> LottieAnimationView {
        let animationView = LottieAnimationView(name: animationName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }

    func updateUIView(_ uiView: LottieAnimationView, context: Context) {}
    
    
}

