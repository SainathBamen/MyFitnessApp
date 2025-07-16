//
//  SignIn Page.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 28/03/25.
//

import SwiftUI

struct SignIn_Page: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // OR Separator
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))

                    Text("OR")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.horizontal, 8)

                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.3))
                }
                .padding(.horizontal, 50)

                // Sign Up Button
                Button(action: {
                    print("Navigate to Sign Up")
                }) {
                    Text("Create New Account")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(
                            LinearGradient(colors: [Color.green, Color.teal],
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .cornerRadius(30)
                        .shadow(color: Color.green.opacity(0.3), radius: 5, x: 0, y: 4)
                        .padding(.horizontal, 40)
                }

                // Forgot Password Link
                HStack {
                    Spacer()
                    NavigationLink(destination: ForgotPasswordView2()) {
                        Text("Forgot Password?")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                            .padding(.trailing, 40)
                            .underline()
                    }
                }
            }
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(.ultraThinMaterial)
                    .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
            )
            .padding(.horizontal, 30)
            .navigationBarHidden(true)
        }
    }
}

// Dummy Forgot Password View
struct ForgotPasswordView: View {
    var body: some View {
        Text("Forgot Password Page")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.blue)
            .navigationTitle("Reset Password")
    }
}

#Preview {
    SignIn_Page()
}
