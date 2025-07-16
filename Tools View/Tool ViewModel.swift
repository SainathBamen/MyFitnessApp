//
//  Tool ViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 16/07/25.
//

import SwiftUI


class ToolsViewModel: ObservableObject {
    @Published var tools: [Tool] = [
        Tool(name: "Personal Work", iconName: "chart.bar.fill", iconColor: .green),
        Tool(name: "HealthKit", iconName: "heart.fill", iconColor: .pink),
        Tool(name: "Diet tool", iconName: "applelogo", iconColor: .orange),
        Tool(name: "Training tool", iconName: "scalemass.fill", iconColor: .blue),
        Tool(name: "BMR Calculator", iconName: "speedometer", iconColor: .purple),
        Tool(name: "Body Fat Calculator", iconName: "figure.stand", iconColor: .blue),
        Tool(name: "Goal Calculator", iconName: "target", iconColor: .green),
        Tool(name: "Macro Calculator", iconName: "chart.pie.fill", iconColor: .red),
        Tool(name: "Calorie Calculator", iconName: "flame.fill", iconColor: .orange),
        Tool(name: "1RM Calculator", iconName: "figure.strengthtraining.traditional", iconColor: .green),
        Tool(name: "Reminders", iconName: "clock.fill", iconColor: .blue),
        Tool(name: "Water Intake", iconName: "drop.fill", iconColor: .blue),
        Tool(name: "Exercise Info", iconName: "figure.run", iconColor: .orange),
        Tool(name: "BMI Calculator", iconName: "scalemass", iconColor: .red),
        Tool(name: "Food Info", iconName: "fork.knife", iconColor: .pink)
    ]
}

