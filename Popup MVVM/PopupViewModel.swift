//
//  PopupViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 19/06/25.
//

//import SwiftUI
//
//class PopUpViewModel: ObservableObject {
//    @Published var showAd = false
//    @Published var scaleEffect: CGFloat = 0.8
//
//    func startAdTimer() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            withAnimation(.spring()) {
//                self.showAd = true
//                self.scaleEffect = 1.0
//            }
//        }
//    }
//
//    func closeAd() {
//        withAnimation {
//            self.showAd = false
//        }
//    }
//}
//import SwiftUI
//
//
//class PopUpViewModel: ObservableObject {
//    @Published var showPopUp: Bool = false
//
//    func showPopUpAfterDelay() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
//            self.showPopUp = true
//        }
//    }
//
//    func closePopUp() {
//        showPopUp = false
//    }
//}
