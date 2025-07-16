//
//  TrainersViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 01/04/25.
//

import Foundation

// MARK: - ViewModel to Fetch Users
class UserViewModel: ObservableObject {
    @Published var users: [Datum] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    let url = "https://reqres.in/api/users?page=2"

    func fetchUsers() async {
        isLoading = true
        errorMessage = nil

        guard let apiURL = URL(string: url) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: apiURL)
            let decodedResponse = try JSONDecoder().decode(Welcome.self, from: data)
            DispatchQueue.main.async {
                self.users = decodedResponse.data
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Failed to load data: \(error.localizedDescription)"
                self.isLoading = false
            }
        }
    }
}
