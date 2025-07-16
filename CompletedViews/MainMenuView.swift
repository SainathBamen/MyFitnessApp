//
//  MainMenuView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 06/06/25.
//

import SwiftUI

struct MainHomeView: View {
    @State private var showSettings = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Horizontal Button Scroll
                    PlanView()
                        .padding(.top, 10)
                    Divider()
                    
                    
                    Divider()
                    
                    // Suggested Trainers Grid
                    TrainerFollowView()
                }
                .padding(.bottom, 20)
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showSettings = true
                    }) {
                        Image(systemName: "gear")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                    }
                }
            }
            .navigationDestination(isPresented: $showSettings) {
                SettingView()
            }
        }
    }
}

#Preview {
    MainHomeView()
}
