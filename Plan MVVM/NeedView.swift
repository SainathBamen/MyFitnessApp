//
//  Need View.swift
//  Reminder App In SwiftUI
//
//  Created by Sainath bamen on 05/04/25.
//

import SwiftUI

struct FitnessTip: Identifiable {
    let id = UUID()
    let icon: String
    let iconColor: Color
    let title: String
    let message: String
}



struct Need_View: View {
    let tip: FitnessTip
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [Color.pink.opacity(0.2), Color.blue.opacity(0.1)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 300, height: 100)
                .clipped() // Prevents content overflow
            
            HStack(alignment: .center, spacing: 12) {
                Image(systemName: tip.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(tip.iconColor)
                    .padding(.leading, 8)

                VStack(alignment: .leading, spacing: 4) {
                    Text(tip.title)
                        .font(.caption)
                        .foregroundColor(.black)
                    
                    Text(tip.message)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .lineLimit(2)
                }

                Spacer()
                
                Button {
                    print("Tapped: \(tip.title)")
                } label: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 30, height: 30)
                        .overlay(
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)
                        )
                }
            }
            .frame(height: 100) // Force HStack height
            .padding(.horizontal, 12)
        }
        .frame(width: 300, height: 100) // Ensure outer frame is consistent
        .padding(.vertical, 8)
    }
}




struct FitnessTipsScrollView: View {
 
    
    let tips: [FitnessTip] = [
        FitnessTip(icon: "headphones", iconColor: .orange, title: "NEED FITNESS GUIDANCE?", message: "Get a FREE call with our\nexpert counsellors"),
        FitnessTip(icon: "flame.fill", iconColor: .red, title: "BURN CALORIES QUICKLY", message: "Try our HIIT workout plans\nwith expert trainers"),
        FitnessTip(icon: "heart.fill", iconColor: .pink, title: "STAY HEALTHY", message: "Explore routines that improve\ncardiovascular")
    ]

    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(tips) { tip in
                    Need_View(tip: tip)
                }
            }
            .padding(.horizontal)
        }
    }
}


#Preview {
    FitnessTipsScrollView()
}
