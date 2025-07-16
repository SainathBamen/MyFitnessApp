//
//  GroupView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 28/04/25.
//

import SwiftUI
// MARK: - Group Card View
struct GroupCardView: View {
    let group: Group2
    @State private var isVisible = false
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                Image(group.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 130)
                    .clipped()
                    .cornerRadius(16, corners: [.topLeft, .topRight])
                
                HStack {
                    Text(group.isPaid ? "Paid" : "Free")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .background(group.isPaid ? Color.orange : Color.green)
                        .cornerRadius(4)
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "person.3.fill")
                        Text("\(group.members)")
                    }
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(4)
                }
                .padding(8)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(group.name)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(group.location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                Spacer()
                
                Button(action: {
                    showAlert = true
                }) {
                    Text(group.isFull ? "Sorry, we’re full!" : "Know More")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 8)
                        .background(group.isFull ? Color.red.opacity(0.7) : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(group.isFull)
                .alert("Do you want to join this group?", isPresented: $showAlert) {
                    Button("Confirm") {
                        print("✅ Joined \(group.name)")
                    }
                    Button("Cancel", role: .cancel) { }
                }
            }
            .padding(12)
            .frame(height: 120)
        }
        .frame(height: 250)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 3)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray5), lineWidth: 0.5)
        )
        .opacity(isVisible ? 1 : 0)
        .offset(y: isVisible ? 0 : 30)
        .animation(.easeOut(duration: 0.5).delay(Double(group.id) * 0.5), value: isVisible)
        .onAppear {
            isVisible = true
        }
    }
}

// MARK: - Main GroupsView
struct GroupsView: View {
    @StateObject private var viewModel = GroupsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16),
                                    GridItem(.flexible(), spacing: 16)], spacing: 16) {
                    // ✅ Correct ForEach — value type pass kar raha hai
                    ForEach(viewModel.groups) { group in
                        GroupCardView(group: group)
                    }
                }
                                    .padding()
            }
            .navigationTitle("📚 Fitness Groups")
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

// MARK: - Corner Radius Extension
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// MARK: - Preview
#Preview {
    GroupsView()
}
