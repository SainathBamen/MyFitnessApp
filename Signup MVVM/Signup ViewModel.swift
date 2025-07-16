//
//  Signup ViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 09/07/25.
//

import SwiftUI


//ViewModel
class SignUpViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isSignedUp: Bool = false
    @Published var errorMessage: String?
    @Published var showLogin: Bool = false

    func signUp() {
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "⚠️ Please fill all fields."
            isSignedUp = false
            return
        }

        guard password == confirmPassword else {
            errorMessage = "⚠️ Passwords do not match."
            isSignedUp = false
            return
        }

        errorMessage = nil
        isSignedUp = true
    }
}
