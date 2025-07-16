//
//  ForgotViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 07/07/25.
//

import SwiftUI

class ForgotPasswordViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var message: String? = nil
    @Published var isSuccess: Bool = false

    func sendResetLink() {
        if email.isEmpty {
            message = "⚠️ Please enter your email."
            isSuccess = false
        } else if isValidEmail(email) {
            message = "✅ Password reset link sent to your email!"
            isSuccess = true
        } else {
            message = "❌ Invalid email address."
            isSuccess = false
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
}
