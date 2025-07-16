//
//  GroupViewFinal.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 07/06/25.
//

//import SwiftUI
//
//struct CombinedOfferGroupsView: View {
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 32) {
//                    
//                    // MARK: - Offers Section
//                    VStack(alignment: .leading, spacing: 16) {
//                        Text("🔥 Today's Offers")
//                            .font(.title3)
//                            .fontWeight(.bold)
//                            .padding(.horizontal)
//                        AdvertisementView()
//
//                        OfferSlidingView()
//                            .frame(height: 240)
//                    }
//                    
//                    // MARK: - Supplements Section
//                    VStack(alignment: .leading, spacing: 16) {
//                        Text("💪 Supplements")
//                            .font(.title3)
//                            .fontWeight(.bold)
//                            .padding(.horizontal)
//                        
//                        CartSlidingView()
//                            .frame(height: 250)
//                    }
//                    
//                    // MARK: - Community Groups Section
//                    VStack(alignment: .leading, spacing: 16) {
//                        Text("👥 Join Fitness Groups")
//                            .font(.title3)
//                            .fontWeight(.bold)
//                            .padding(.horizontal)
//                        
//                        GroupsView()
//                            .frame(minHeight: 700)
//                    }
//                    
//                }
//                .padding(.vertical)
//            }
//            .background(Color(.systemGroupedBackground).ignoresSafeArea())
//            .navigationTitle("🏋️‍♂️ Fitness Hub")
//        }
//    }
//}
//
//#Preview {
//    CombinedOfferGroupsView()
//}


//import SwiftUI
//
//struct CombinedOfferGroupsView: View {
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 32) {
//                    offersSection()
//                    supplementsSection()
//                    communityGroupsSection()
//                }
//                .padding(.vertical)
//            }
//            .background(Color(.systemGroupedBackground).ignoresSafeArea())
//            .navigationTitle("🏋️‍♂️ Fitness Hub")
//        }
//    }
//
//    // MARK: - Offers Section
//    private func offersSection() -> some View {
//        VStack(alignment: .leading, spacing: 16) {
//            sectionHeader("🔥 Today's Offers")
//            AdvertisementView()
//            OfferSlidingView()
//                .frame(height: 240)
//        }
//    }
//
//    // MARK: - Supplements Section
//    private func supplementsSection() -> some View {
//        VStack(alignment: .leading, spacing: 16) {
//            sectionHeader("💪 Supplements")
//            CartSlidingView()
//                .frame(height: 250)
//        }
//    }
//
//    // MARK: - Community Groups Section
//    private func communityGroupsSection() -> some View {
//        VStack(alignment: .leading, spacing: 16) {
//            sectionHeader("👥 Join Fitness Groups")
//            GroupsView()
//                .frame(minHeight: 700)
//        }
//    }
//
//    // MARK: - Section Header Reusable View
//    private func sectionHeader(_ title: String) -> some View {
//        Text(title)
//            .font(.title3)
//            .fontWeight(.bold)
//            .padding(.horizontal)
//    }
//}
//
//#Preview {
//    CombinedOfferGroupsView()
//}


//import SwiftUI
//
//struct CombinedOfferGroupsView: View {
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 32) {
//                    
//                    // MARK: - Advertisement Banner
//                    AdvertisementView()
//                        .padding(.top)
//                    
//                    // MARK: - Offer Sliding Images
//                    VStack(alignment: .center, spacing: 16) {
//                        sectionHeader("🔥 Today's Offers")
//                        OfferSlidingView()
//                            .frame(height: 240)
//                    }
//
//                    // MARK: - Supplement Sliding Images
//                    VStack(alignment: .center, spacing: 16) {
//                        sectionHeader("💪 Supplements")
//                        CartSlidingView()
//                            .frame(height: 250)
//                    }
//                    
//                    // MARK: - Fitness Groups Section
//                    VStack(alignment: .center, spacing: 16) {
//                        sectionHeader("👥 Join Fitness Groups")
//                        GroupView() // <-- isme ab andar scrollview nahi hai
//                    }
//                    
//                }
//                .padding(.vertical)
//            }
//            .background(Color(.systemGroupedBackground).ignoresSafeArea())
//            .navigationTitle("🏋️‍♂️ Fitness Hub")
//        }
//    }
//    
//    // MARK: - Section Header
//    private func sectionHeader(_ title: String) -> some View {
//        Text(title)
//            .font(.title3)
//            .fontWeight(.bold)
//            .padding(.horizontal)
//    }
//}
//
//#Preview {
//    CombinedOfferGroupsView()
//}


import SwiftUI

struct CombinedOfferGroupsView: View {
    var body: some View {
        NavigationStack {
            ScrollView  {
                VStack(alignment: .leading, spacing: 16) {
                    
                    AdvertisementView(animationTrigger: true)
                        .padding(10)
                    
                    VStack(spacing: 20) {
                        sectionHeader("🔥 Today's Offers")
                        OfferSlidingView()
                    }

                    VStack(spacing: 16) {
                        sectionHeader("💪 Supplements")
                        CartSlidingView()
                    }

                    VStack(spacing: 16) {
                        sectionHeader("📝 Workout")
                        WriteWorkoutView()
                    }
                    VStack(spacing: 16){
                        CoachNSupplementView() // <-- no frame here
                    }

                    

                }
                .frame(maxWidth: 430, alignment: .leading)
                .padding(.horizontal, 16)
                .padding(.bottom, 0) // <-- ensure bottom padding is zero
            }
            .background(Color.white.ignoresSafeArea())
            .navigationTitle("🏋️‍♂️ Fitness Hub")
        }
    }
    
    // MARK: - Section Header
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    CombinedOfferGroupsView()
}
