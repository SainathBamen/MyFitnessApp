//
//  NotificationScreen.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 06/06/25.
//

//import SwiftUI
//
//struct NotificationScreen: View {
//    @State private var selectedTab = "Notifications"
//
//    let notifications = [
//        "Sainath Bamen",
//        "Jitendra Chouksey",
//        "Ankita Singh",
//        "Rohit Sharma",
//        "Virat Kohli"
//    ]
//
//    var body: some View {
//        VStack(spacing: 0) {
//            // Top Tabs & Menu
//            HStack(spacing: 20) {
//                TabButton(title: "Notifications", selectedTab: $selectedTab)
//                TabButton(title: "Announcements", selectedTab: $selectedTab)
//
//                Spacer()
//
//                Button {
//                    // menu action
//                } label: {
//                    Image(systemName: "ellipsis")
//                        .rotationEffect(.degrees(90))
//                        .font(.system(size: 18))
//                        .padding(8)
//                        .background(Color(.systemGray5))
//                        .clipShape(Circle())
//                }
//            }
//            .padding(.horizontal)
//            .padding(.top, 20)
//
//            // List of Notifications
//            ScrollView(showsIndicators: false) {
//                VStack(spacing: 16) {
//                    ForEach(notifications, id: \.self) { name in
//                        NotificationCard(name: name)
//                    }
//                }
//                .padding(.horizontal)
//                .padding(.top, 20)
//                .padding(.bottom, 40)
//            }
//        }
//        .background(Color(.systemGroupedBackground).ignoresSafeArea())
//    }
//}
//
//struct TabButton: View {
//    var title: String
//    @Binding var selectedTab: String
//
//    var body: some View {
//        Button {
//            selectedTab = title
//        } label: {
//            Text(title)
//                .font(.system(size: 14, weight: .medium))
//                .foregroundColor(selectedTab == title ? .black : .gray)
//                .padding(.vertical, 8)
//                .padding(.horizontal, 16)
//                .background(selectedTab == title ? Color.white : Color(.systemGray5))
//                .cornerRadius(10)
//        }
//    }
//}
//
//struct NotificationCard: View {
//    var name: String
//
//    var body: some View {
//        HStack(alignment: .top, spacing: 12) {
//            Image("profile")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 55, height: 55)
//                .clipShape(RoundedRectangle(cornerRadius: 12))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 12)
//                        .stroke(Color(.systemGray5), lineWidth: 1)
//                )
//
//            VStack(alignment: .leading, spacing: 6) {
//                Text(name)
//                    .font(.system(size: 16, weight: .bold))
//
//                Text("Welcome to FitX! 🚀 Let’s start your fitness journey.")
//                    .font(.system(size: 14))
//                    .foregroundColor(.secondary)
//                    .lineLimit(2)
//
//                Text("2mo ago")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//            }
//
//            Spacer()
//
//            Button {
//                // delete action
//            } label: {
//                Image(systemName: "xmark")
//                    .font(.system(size: 13, weight: .medium))
//                    .foregroundColor(.gray)
//                    .padding(6)
//                    .background(Color(.systemGray6))
//                    .clipShape(Circle())
//            }
//        }
//        .padding(14)
//        .background(Color.white)
//        .cornerRadius(14)
//        .shadow(color: Color.black.opacity(0.04), radius: 3, x: 0, y: 2)
//    }
//}
//
//#Preview {
//    NotificationScreen()
//}

import SwiftUI

struct NotificationItem: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let timeAgo: String
}

import SwiftUI

class NotificationViewModel: ObservableObject {
    @Published var selectedTab: String = "Notifications"
    
    @Published var notifications: [NotificationItem] = [
        NotificationItem(name: "Sainath Bamen", message: "Welcome to FitX! 🚀 Let’s start your fitness journey.", timeAgo: "2mo ago"),
        NotificationItem(name: "Jitendra Chouksey", message: "Don’t miss your workout today!", timeAgo: "1mo ago"),
        NotificationItem(name: "Ankita Singh", message: "Your new meal plan is ready!", timeAgo: "2w ago")
    ]
    
    @Published var announcements: [NotificationItem] = [
        NotificationItem(name: "Admin", message: "New features added in app 🚀", timeAgo: "1w ago"),
        NotificationItem(name: "Coach Team", message: "Live workout session tomorrow 7am!", timeAgo: "2d ago")
    ]
    
    func deleteNotification(at index: Int) {
        notifications.remove(at: index)
    }
    
    func deleteAnnouncement(at index: Int) {
        announcements.remove(at: index)
    }
}


import SwiftUI

struct NotificationScreen: View {
    @StateObject private var viewModel = NotificationViewModel()

    var body: some View {
        VStack(spacing: 0) {
            // Top Tabs & Menu
            HStack(spacing: 20) {
                TabButton(title: "Notifications", selectedTab: $viewModel.selectedTab)
                TabButton(title: "Announcements", selectedTab: $viewModel.selectedTab)

                Spacer()

                Button {
                    // menu action
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .font(.system(size: 18))
                        .padding(8)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)
            .padding(.top, 20)

            // Notification List
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    if viewModel.selectedTab == "Notifications" {
                        ForEach(Array(viewModel.notifications.enumerated()), id: \.1.id) { index, notification in
                            NotificationCard(notification: notification) {
                                viewModel.deleteNotification(at: index)
                            }
                        }
                    } else {
                        ForEach(Array(viewModel.announcements.enumerated()), id: \.1.id) { index, announcement in
                            NotificationCard(notification: announcement) {
                                viewModel.deleteAnnouncement(at: index)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.bottom, 40)
            }
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

struct TabButton: View {
    let title: String
    @Binding var selectedTab: String

    var body: some View {
        Button {
            selectedTab = title
        } label: {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(selectedTab == title ? .black : .gray)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(selectedTab == title ? Color.white : Color(.systemGray5))
                .cornerRadius(10)
        }
    }
}

struct NotificationCard: View {
    let notification: NotificationItem
    var onDelete: () -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 55, height: 55)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )

            VStack(alignment: .leading, spacing: 6) {
                Text(notification.name)
                    .font(.system(size: 16, weight: .bold))

                Text(notification.message)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                Text(notification.timeAgo)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: onDelete) {
                Image(systemName: "xmark")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(6)
                    .background(Color(.systemGray6))
                    .clipShape(Circle())
            }
        }
        .padding(14)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.04), radius: 3, x: 0, y: 2)
    }
}

#Preview{
    NotificationScreen()
    
}



