//
//  ReminderClientView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//

import SwiftUI

struct ClientReminderView: View {
    @StateObject private var viewModel = ReminderViewModel()
    @State private var newReminder = ""
    @State private var reminderDate = Date()

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.blue.opacity(0.1), .purple.opacity(0.05)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("📌 Your Reminders")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.top)

                    HStack(spacing: 12) {
                        TextField("Enter reminder...", text: $newReminder)
                            .textFieldStyle(.roundedBorder)
                            .frame(minWidth: 150)

                        DatePicker("", selection: $reminderDate, displayedComponents: .hourAndMinute)
                            .labelsHidden()

                        Button {
                            viewModel.addReminder(title: newReminder, date: reminderDate)
                            newReminder = ""
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.blue)
                                .shadow(radius: 4)
                        }
                        .disabled(newReminder.isEmpty)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    .padding(.horizontal)

                    if viewModel.reminders.isEmpty {
                        Spacer()
                        Text("📝 No reminders yet.")
                            .foregroundColor(.gray)
                            .font(.headline)
                        Spacer()
                    } else {
                        List {
                            ForEach(viewModel.reminders) { reminder in
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(reminder.title)
                                            .font(.headline)
                                        Text("At: \(reminder.date, formatter: DateFormatter.shortTimeFormatter)")
                                            .font(.footnote)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Image(systemName: "bell.fill")
                                        .foregroundColor(.blue)
                                }
                                .padding(8)
                                .background(.ultraThinMaterial)
                                .cornerRadius(12)
                            }
                            .onDelete(perform: viewModel.deleteReminder)
                        }
                        .listStyle(.plain)
                    }
                    Spacer()
                }
                .padding(.bottom)
            }
            .navigationTitle("🕒 Reminder App")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ClientReminderView()
}


extension DateFormatter {
    static var shortTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }
}
