
//
//  ContentView.swift
//  Reminder App In SwiftUI
//
//  Created by Sainath bamen on 01/04/25.
//
//
//
//

//import SwiftUI
//import UserNotifications
//
//struct Reminder: Identifiable, Codable, Equatable {
//    var id = UUID()
//    var title: String
//    var date: Date
//}
//
//class ReminderViewModel: ObservableObject {
//    @Published var reminders: [Reminder] = []
//    @AppStorage("reminders") private var remindersData: Data = Data()
//
//    init() {
//        loadReminders()
//        requestNotificationPermission()
//    }
//
//    func addReminder(title: String, date: Date) {
//        let reminder = Reminder(title: title, date: date)
//        reminders.append(reminder)
//        scheduleNotification(for: reminder)
//        saveReminders()
//    }
//
//    func deleteReminder(at offsets: IndexSet) {
//        reminders.remove(atOffsets: offsets)
//        saveReminders()
//    }
//
//    private func saveReminders() {
//        if let encoded = try? JSONEncoder().encode(reminders) {
//            remindersData = encoded
//        }
//    }
//
//    private func loadReminders() {
//        if let decoded = try? JSONDecoder().decode([Reminder].self, from: remindersData) {
//            reminders = decoded
//        }
//    }
//
//    private func requestNotificationPermission() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            print(granted ? "Notifications allowed" : "Notifications denied")
//        }
//    }
//
//    private func scheduleNotification(for reminder: Reminder) {
//        let content = UNMutableNotificationContent()
//        content.title = "Reminder"
//        content.body = reminder.title
//        content.sound = .default
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminder.date), repeats: false)
//
//        let request = UNNotificationRequest(identifier: reminder.id.uuidString, content: content, trigger: trigger)
//
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print("Failed to schedule: \(error.localizedDescription)")
//            }
//        }
//    }
//}
//
//struct ClientReminderView: View {
//    @StateObject private var viewModel = ReminderViewModel()
//    @State private var newReminder = ""
//    @State private var reminderDate = Date()
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                // Background
//                LinearGradient(colors: [.blue.opacity(0.1), .purple.opacity(0.05)],
//                               startPoint: .topLeading, endPoint: .bottomTrailing)
//                    .ignoresSafeArea()
//
//                VStack(spacing: 20) {
//                    // Title
//                    Text("📌 Your Reminders")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .foregroundColor(.primary)
//                        .padding(.top)
//
//                    // Input Section
//                    HStack(spacing: 12) {
//                        TextField("Enter reminder...", text: $newReminder)
//                            .textFieldStyle(.roundedBorder)
//                            .frame(minWidth: 150)
//
//                        DatePicker("", selection: $reminderDate, displayedComponents: .hourAndMinute)
//                            .labelsHidden()
//
//                        Button {
//                            viewModel.addReminder(title: newReminder, date: reminderDate)
//                            newReminder = ""
//                        } label: {
//                            Image(systemName: "plus.circle.fill")
//                                .font(.system(size: 30))
//                                .foregroundColor(.blue)
//                                .shadow(radius: 4)
//                        }
//                        .disabled(newReminder.isEmpty)
//                    }
//                    .padding()
//                    .background(.ultraThinMaterial)
//                    .cornerRadius(16)
//                    .padding(.horizontal)
//
//                    // List Section
//                    if viewModel.reminders.isEmpty {
//                        Spacer()
//                        Text("📝 No reminders yet.")
//                            .foregroundColor(.gray)
//                            .font(.headline)
//                        Spacer()
//                    } else {
//                        List {
//                            ForEach(viewModel.reminders) { reminder in
//                                HStack {
//                                    VStack(alignment: .leading, spacing: 4) {
//                                        Text(reminder.title)
//                                            .font(.headline)
//                                            .foregroundColor(.primary)
//                                        Text("At: \(reminder.date, formatter: DateFormatter.shortTimeFormatter)")
//                                            .font(.footnote)
//                                            .foregroundColor(.gray)
//                                    }
//                                    Spacer()
//                                    Image(systemName: "bell.fill")
//                                        .foregroundColor(.blue)
//                                }
//                                .padding(8)
//                                .background(.ultraThinMaterial)
//                                .cornerRadius(12)
//                                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
//                            }
//                            .onDelete(perform: viewModel.deleteReminder)
//                        }
//                        .listStyle(.plain)
//                    }
//                    Spacer()
//                }
//                .padding(.bottom)
//            }
//            .navigationTitle("🕒 Reminder App")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//#Preview {
//    ClientReminderView()
//}
//
//extension DateFormatter {
//    static var shortTimeFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .none
//        formatter.timeStyle = .short
//        return formatter
//    }
//}
