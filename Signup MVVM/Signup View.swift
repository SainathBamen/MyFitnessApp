//
//  Signup View.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 03/06/25.
//



//View.

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.systemGray6), Color.white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack {
                    Circle()
                        .fill(LinearGradient(colors: [Color.purple.opacity(0.3), Color.blue.opacity(0.3)],
                                             startPoint: .top, endPoint: .bottom))
                        .frame(width: 500, height: 500)
                        .offset(y: -250)
                    Spacer()
                }
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 30) {
                        // App Icon
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .background(Circle().fill(LinearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
                                .frame(width: 120, height: 120))
                            .shadow(radius: 8)
                            .padding(.top, 40)
                        
                        Text("Create Account")
                            .font(.system(size: 34, weight: .heavy))
                            .foregroundStyle(
                                LinearGradient(colors: [Color.purple, Color.blue],
                                               startPoint: .leading,
                                               endPoint: .trailing)
                            )
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        
                        VStack(spacing: 24) {
                            CustomTextField(icon: "person.fill", placeholder: "Full Name", text: $viewModel.name)
                                .frame(maxWidth: 320)
                            CustomTextField(icon: "envelope.fill", placeholder: "Email Address", text: $viewModel.email, keyboardType: .emailAddress)
                                .frame(maxWidth: 320)
                            CustomSecureField(icon: "lock.fill", placeholder: "Password", text: $viewModel.password)
                                .frame(maxWidth: 320)
                            CustomSecureField(icon: "lock.rotation", placeholder: "Confirm Password", text: $viewModel.confirmPassword)
                                .frame(maxWidth: 320)
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(25)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 10, y: 3)
                        
                        if let error = viewModel.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .font(.subheadline)
                        }
                        
                        Button(action: {
                            withAnimation(.spring()) {
                                viewModel.signUp()
                            }
                        }) {
                            Text("Sign Up")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: 300)
                                .frame(height: 55)
                                .background(
                                    LinearGradient(colors: [Color.purple, Color.blue],
                                                   startPoint: .leading, endPoint: .trailing)
                                )
                                .cornerRadius(30)
                                .shadow(color: Color.purple.opacity(0.4), radius: 5, x: 0, y: 4)
                        }
                        .padding(.horizontal)
                        
                        if viewModel.isSignedUp {
                            Text("🎉 Account Created Successfully!")
                                .foregroundColor(.green)
                                .fontWeight(.medium)
                        }
                        
                        // Already have an account + NavigationLink Login button
                        VStack(spacing: 8) {
                            Text("Already have an account?")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            NavigationLink(destination: LoginView(), isActive: $viewModel.showLogin) {
                                Button(action: {
                                    viewModel.showLogin = true
                                }) {
                                    Text("Login")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.purple)
                                }
                            }
                        }
                        .padding(.top, 20)
                        
                        Spacer(minLength: 30)
                    }
                    .padding(.vertical)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    SignUpView()
}
