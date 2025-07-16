//
//  PersonalWorkView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 30/04/25.
//

import SwiftUI
import SwiftData

struct PersonalWorkView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = PersonalWorkViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Text("📝 Add Your Today's Workout")
                    .font(.system(size: 27, weight: .bold))
                    .foregroundStyle(
                        LinearGradient(colors: [.blue, .cyan], startPoint: .leading, endPoint: .trailing)
                    )
                    .padding(.top, 20)

                HStack(spacing: 12) {
                    TextField("Add new workout...", text: $viewModel.newWorkTitle)
                        .padding(14)
                        .background(.thinMaterial)
                        .cornerRadius(14)
                        .frame(width: 200)

                    TextField("Sets", text: $viewModel.newWorkSets)
                        .keyboardType(.numberPad)
                        .padding(14)
                        .background(.thinMaterial)
                        .cornerRadius(14)
                        .frame(width: 70)

                    Button(action: {
                        viewModel.addWork()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 38))
                            .foregroundColor(.blue)
                    }
                    .disabled(viewModel.newWorkTitle.isEmpty || viewModel.newWorkSets.isEmpty)
                    .scaleEffect((viewModel.newWorkTitle.isEmpty || viewModel.newWorkSets.isEmpty) ? 1.0 : 1.1)
                    .animation(.easeInOut, value: viewModel.newWorkTitle)
                    .animation(.easeInOut, value: viewModel.newWorkSets)
                }
                .padding(.horizontal)

                if viewModel.works.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "tray.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray.opacity(0.2))

                        Text("No tasks added yet.")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 60)
                } else {
                    List {
                        ForEach(viewModel.works) { work in
                            HStack(spacing: 16) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.cyan)
                                    .font(.title3)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(work.title)
                                        .font(.body)
                                        .fontWeight(.medium)

                                    Text("Sets: \(work.sets)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }

                                Spacer()
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white)
                                    .shadow(color: .black.opacity(0.05), radius: 3)
                            )
                        }
                        .onDelete(perform: viewModel.deleteWork)
                    }
                    .listStyle(.plain)
                }

                Spacer()
            }
            .background(
                LinearGradient(colors: [.white, .blue.opacity(0.04)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            )
        }
        .onAppear {
            viewModel.context = context
            viewModel.fetchWorks()
        }
    }
}


#Preview{
    PersonalWorkView()
}
