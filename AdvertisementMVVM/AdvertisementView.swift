//
//  AdvertisementView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 21/06/25.
//

//import SwiftUI
//
//struct AdvertisementView: View {
//    @State private var offset: CGFloat = UIScreen.main.bounds.width
//    var animationTrigger: Bool
//
//    var body: some View {
//        ZStack {
//            Color.white // <-- background white
//
//            Text("🔥 Big Sale: 50% OFF on all products! 🛒 Hurry Up!")
//                .font(.system(size: 23, weight: .bold, design: .rounded))
//                .foregroundColor(.red)
//                .fixedSize()
//                .offset(x: offset)
//                .onChange(of: animationTrigger) {
//                    if animationTrigger {
//                        offset = UIScreen.main.bounds.width
//                        startAnimation()
//                    }
//                }
//        }
//        .ignoresSafeArea() // agar full screen chahiye
//        .task {
//            if animationTrigger {
//                offset = UIScreen.main.bounds.width
//                startAnimation()
//            }
//        }
//    }
//
//    func startAnimation() {
//        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
//            offset = -UIScreen.main.bounds.width
//        }
//    }
//}
//
//#Preview {
//    AdvertisementView(animationTrigger: true)
//}
//
//ViewModel :- MVVVM.


//View -> MVVM
import SwiftUI

struct AdvertisementView: View {
    @StateObject private var viewModel = AdvertisementViewModel()
    var animationTrigger: Bool

    var body: some View {
        ZStack {
            Color.white

            Text("🔥 Big Sale: 50% OFF on all products! 🛒 Hurry Up!")
                .font(.system(size: 23, weight: .bold, design: .rounded))
                .foregroundColor(.red)
                .fixedSize()
                .offset(x: viewModel.offset)
                .onChange(of: animationTrigger) { _ in
                    if animationTrigger {
                        viewModel.resetAndStartAnimation()
                    }
                }
        }
        .ignoresSafeArea()
        .task {
            if animationTrigger {
                viewModel.resetAndStartAnimation()
            }
        }
    }
}

#Preview {
    AdvertisementView(animationTrigger: true)
}
