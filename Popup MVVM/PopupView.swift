//
//  PopupView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 19/06/25.
//


//import SwiftUI
//
//struct PopUpView: View {
//    @ObservedObject var viewModel: PopUpViewModel
//
//    var body: some View {
//        ZStack {
//            Color.black.opacity(0.5)
//                .ignoresSafeArea()
//
//            VStack(spacing: 25) {
//                Image(systemName: "gift.fill")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 70, height: 70)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(
//                        LinearGradient(colors: [.pink, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
//                    )
//                    .clipShape(Circle())
//                    .shadow(radius: 10)
//
//                Text("🎉 Surprise Offer!")
//                    .font(.title.bold())
//                    .foregroundColor(.white)
//
//                Text("6 second baad yeh pop-up aaya hai! Apna offer claim karo.")
//                    .multilineTextAlignment(.center)
//                    .font(.body)
//                    .foregroundColor(.white)
//                    .padding(.horizontal)
//
//                Button(action: {
//                    viewModel.closePopUp()
//                }) {
//                    Text("Close")
//                        .fontWeight(.bold)
//                        .padding(.vertical, 14)
//                        .padding(.horizontal, 50)
//                        .background(
//                            LinearGradient(colors: [.purple, .pink], startPoint: .leading, endPoint: .trailing)
//                        )
//                        .foregroundColor(.white)
//                        .cornerRadius(30)
//                        .shadow(radius: 8)
//                }
//                .buttonStyle(PlainButtonStyle())
//            }
//            .padding()
//            .background(
//                LinearGradient(colors: [Color.purple.opacity(0.9), Color.black.opacity(0.9)],
//                               startPoint: .topLeading, endPoint: .bottomTrailing)
//            )
//            .cornerRadius(30)
//            .shadow(radius: 20)
//            .padding(40)
//            .scaleEffect(1.05)
//        }
//    }
//}

import SwiftUI

struct PopupCard: View {
    @Binding var showPopup: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "sparkles")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundStyle(LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
                .padding(.top, 20)
            
            Text("🎉 Welcome to FitTabView!")
                .font(.title.bold())
                .multilineTextAlignment(.center)
            
            Text("Thank you for joining. Explore the features using the tabs below and make your fitness journey smarter.")
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Button(action: {
                withAnimation {
                    showPopup = false
                }
            }) {
                Text("Let's Go")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .cornerRadius(14)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .frame(width: 320)
        .background(.ultraThinMaterial)
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: 10)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(LinearGradient(colors: [.purple.opacity(0.4), .blue.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1.5)
        )
        .padding()
    }
}
