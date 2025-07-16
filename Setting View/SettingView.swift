//
//  SettingView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//

//import SwiftUI
//
//struct SettingView: View {
//    @StateObject private var viewModel = SettingsViewModel()
//    
//    var body: some View {
//            List {
//                // Profile Section
//                Section {
//                    HStack {
//                        Image(systemName: "person.crop.circle.fill")
//                            .resizable()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(.gray)
//                        VStack(alignment: .leading) {
//                            Text("Hey, Sai")
//                                .font(.headline)
//                            Text("Complete your profile here")
//                                .font(.subheadline)
//                                .foregroundColor(.gray)
//                        }
//                        Spacer()
//                        Image(systemName: "chevron.right")
//                            .foregroundColor(.gray)
//                    }
//                    .padding()
//                    .background(Color.yellow.opacity(0.2))
//                    .cornerRadius(10)
//                    .listRowSeparator(.hidden)
//                }
//                
//                // First Section
//                Section {
//                    ForEach(viewModel.firstSectionItems) { item in
//                        NavigationLink(destination: Text(item.destination)) {
//                            Label(item.title, systemImage: item.iconName)
//                        }
//                        .listRowSeparator(.hidden)
//                    }
//                }
//                
//                // Second Section
//                Section {
//                    ForEach(viewModel.secondSectionItems) { item in
//                        NavigationLink(destination: Text(item.destination)) {
//                            Label(item.title, systemImage: item.iconName)
//                        }
//                        .listRowSeparator(item.title == "Community Guidelines" ? .visible : .hidden)
//                    }
//                }
//                
//                // App Version
//                Section {
//                    HStack {
//                        Label("App Version: \(viewModel.appVersion)", systemImage: "iphone")
//                        Spacer()
//                    }
//                }
//                .listRowSeparator(.hidden)
//            }
//            .navigationTitle("Settings")
//        }
//    
//}
//
//
//#Preview {
//    SettingView()
//}


import SwiftUI

struct SettingView: View {
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        List {
            // Profile Section
            Section {
                HStack(spacing: 16) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                        .background(Circle().fill(LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)))
                        .padding(4)

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Hey, Sai")
                            .font(.title3.bold())
                        Text("Complete your profile here")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Spacer()

                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 10)
            }
            .listRowBackground(Color.yellow.opacity(0.15))
            .cornerRadius(12)
            .listRowSeparator(.hidden)
            
            // First Section
            Section {
                ForEach(viewModel.firstSectionItems) { item in
                    NavigationLink {
                        Text(item.destination)
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: item.iconName)
                                .foregroundColor(.blue)
                                .font(.system(size: 22))
                                .frame(width: 32, height: 32)
                                .background(Circle().fill(Color.blue.opacity(0.15)))
                            Text(item.title)
                                .font(.body)
                        }
                        .padding(.vertical, 8)
                    }
                    .listRowSeparator(.hidden)
                }
            }

            // Second Section
            Section {
                ForEach(viewModel.secondSectionItems) { item in
                    NavigationLink {
                        Text(item.destination)
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: item.iconName)
                                .foregroundColor(.purple)
                                .font(.system(size: 22))
                                .frame(width: 32, height: 32)
                                .background(Circle().fill(Color.purple.opacity(0.15)))
                            Text(item.title)
                                .font(.body)
                        }
                        .padding(.vertical, 8)
                    }
                    .listRowSeparator(item.title == "Community Guidelines" ? .visible : .hidden)
                }
            }

            // App Version Section
            Section {
                HStack {
                    Image(systemName: "iphone")
                        .foregroundColor(.green)
                        .font(.system(size: 22))
                        .frame(width: 32, height: 32)
                        .background(Circle().fill(Color.green.opacity(0.15)))
                    Text("App Version: \(viewModel.appVersion)")
                        .font(.body)
                    Spacer()
                }
                .padding(.vertical, 8)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.insetGrouped)
        .navigationTitle("⚙️ Settings")
    }
}

#Preview {
    SettingView()
}
