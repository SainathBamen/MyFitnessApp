//
//  ReminderViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//

import SwiftUI
import UserNotifications

class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = []
    @AppStorage("reminders") private var remindersData: Data = Data()

    init() {
        loadReminders()
        requestNotificationPermission()
    }

    func addReminder(title: String, date: Date) {
        let reminder = Reminder(title: title, date: date)
        reminders.append(reminder)
        scheduleNotification(for: reminder)
        saveReminders()
    }

    func deleteReminder(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
        saveReminders()
    }

    private func saveReminders() {
        if let encoded = try? JSONEncoder().encode(reminders) {
            remindersData = encoded
        }
    }

    private func loadReminders() {
        if let decoded = try? JSONDecoder().decode([Reminder].self, from: remindersData) {
            reminders = decoded
        }
    }

    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            print(granted ? "Notifications allowed" : "Notifications denied")
        }
    }

    private func scheduleNotification(for reminder: Reminder) {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = reminder.title
        content.sound = .default

        let trigger = UNCalendarNotificationTrigger(
            dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminder.date),
            repeats: false
        )

        let request = UNNotificationRequest(identifier: reminder.id.uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule: \(error.localizedDescription)")
            }
        }
    }
}

