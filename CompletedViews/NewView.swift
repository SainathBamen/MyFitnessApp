//
//  NewView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 24/06/25.
//

import SwiftUI

struct NewView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    ClientReviewHorizontalView()

                    // Yeh center me
                    HStack {
                        Spacer()
                        NavigationLink(destination: GroupsView()) {
                            OnlyLottieAnimationView()
                        }
                        Spacer()
                    }
                    .padding(.top, -10)

                    TrainerFollowView()
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}


#Preview {
    NewView()
}
