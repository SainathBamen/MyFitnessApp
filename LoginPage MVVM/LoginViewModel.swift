//
//  LoginViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 28/03/25.
//


import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    @Published var isAuthenticated = false

    func login() {
        // Simple validation
        if username.isEmpty || email.isEmpty || password.isEmpty {
            errorMessage = "All fields are required"
            isAuthenticated = false
        } else {
            errorMessage = nil
            // Simulate login success
            isAuthenticated = true
        }
    }
}
