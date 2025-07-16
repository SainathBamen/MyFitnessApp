//
//  ForgotView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 13/05/25.
//

import SwiftUI


struct ForgotPasswordView2: View {
    @StateObject private var viewModel = ForgotPasswordViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color(.systemTeal).opacity(0.4), Color.white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    // Icon with glow
                    ZStack {
                        Circle()
                            .fill(LinearGradient(colors: [Color.blue.opacity(0.4), Color.purple.opacity(0.4)],
                                                 startPoint: .top, endPoint: .bottom))
                            .frame(width: 150, height: 150)
                            .shadow(color: .purple.opacity(0.3), radius: 20, x: 0, y: 10)

                        Image(systemName: "lock.rotation.open")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 60)

                    // Title
                    Text("Forgot Password?")
                        .font(.system(size: 34, weight: .heavy))
                        .foregroundStyle(
                            LinearGradient(colors: [Color.purple, Color.blue],
                                           startPoint: .leading, endPoint: .trailing)
                        )
                        .padding(.top)

                    // Email TextField with Gradient Border
                    HStack(spacing: 14) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.blue)
                            .frame(width: 24, height: 24)
                        TextField("Enter your email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .foregroundColor(.primary)
                    }
                    .padding()
                    .frame(height: 55)
                    .frame(maxWidth: 340)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color(.systemGray6).opacity(0.5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(LinearGradient(colors: [Color.blue, Color.purple],
                                                           startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                            )
                    )
                    .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)

                    // Submit Button
                    Button(action: {
                        withAnimation(.spring()) {
                            viewModel.sendResetLink()
                        }
                    }) {
                        Text("Send Reset Link")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: 300)
                            .frame(height: 55)
                            .background(
                                LinearGradient(colors: [Color.blue, Color.purple],
                                               startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(30)
                            .shadow(color: Color.purple.opacity(0.4), radius: 8, x: 0, y: 5)
                    }
                    .padding(.top, 10)

                    // Message
                    if let message = viewModel.message {
                        Text(message)
                            .foregroundColor(viewModel.isSuccess ? .green : .red)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .transition(.opacity.combined(with: .move(edge: .bottom)))
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button {
//                        // navigation pop
//                    }
//                    label: {
//                        Label("Back", systemImage: "chevron.left")
//                            .foregroundColor(.blue)
//                    }
//                }
//            }
        }
    }
}

#Preview {
    ForgotPasswordView2()
}
