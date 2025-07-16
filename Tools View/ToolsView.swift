//
//  ToolsView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 01/05/25.
//

//import SwiftUI
//
//struct Tool: Identifiable {
//    let id = UUID()
//    let name: String
//    let iconName: String
//    let iconColor: Color
//}
//
//struct ToolsViews: View {
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//    
//    let tools: [Tool] = [
//        Tool(name: "Progress & Insights", iconName: "chart.bar.fill", iconColor: .green),
//        Tool(name: "HealthKit", iconName: "heart.fill", iconColor: .pink),
//        Tool(name: "Diet tool", iconName: "applelogo", iconColor: .orange),
//        Tool(name: "Training tool", iconName: "scalemass.fill", iconColor: .blue),
//        Tool(name: "BMR Calculator", iconName: "speedometer", iconColor: .purple),
//        Tool(name: "Body Fat Calculator", iconName: "figure.stand", iconColor: .blue),
//        Tool(name: "Goal Calculator", iconName: "target", iconColor: .green),
//        Tool(name: "Macro Calculator", iconName: "chart.pie.fill", iconColor: .red),
//        Tool(name: "Calorie Calculator", iconName: "flame.fill", iconColor: .orange),
//        Tool(name: "1RM Calculator", iconName: "figure.strengthtraining.traditional", iconColor: .green),
//        Tool(name: "Reminders", iconName: "clock.fill", iconColor: .blue),
//        Tool(name: "Water Intake", iconName: "drop.fill", iconColor: .blue),
//        Tool(name: "Exercise Info", iconName: "figure.run", iconColor: .orange),
//        Tool(name: "BMI Calculator", iconName: "scalemass", iconColor: .red),
//        Tool(name: "Food Info", iconName: "fork.knife", iconColor: .pink)                
//    ]
//
//    
//    var body: some View {
//        @Environment(\.modelContext) private var context
//
//        NavigationStack {
//
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 16) {
//                    ForEach(tools) { tool in
//                        NavigationLink(destination: destinationView(for: tool)) {
//                            VStack(spacing: 12) {
//                                Image(systemName: tool.iconName)
//                                    .font(.system(size: 30))
//                                    .foregroundColor(tool.iconColor)
//                                Text(tool.name)
//                                    .font(.headline)
//                                    .multilineTextAlignment(.center)
//                                    .foregroundColor(.primary)
//                            }
//                            .frame(maxWidth: .infinity, minHeight: 100)
//                            .padding()
//                            .background(Color(.systemGray6))
//                            .cornerRadius(12)
//                            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
//                        }
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle("⚙️ Tools")
//        }
//    }
//    
//    @ViewBuilder
//    private func destinationView(for tool: Tool) -> some View {
//        switch tool.name {
//        case "Progress & Insights":
//            ClientMeasurementView()
//            
//        case "HealthKit":
//            Text("❤️ HealthKit Screen")
//            
//        case "Diet tool":
//            Text("🍎 Diet Tool Screen")
//            
//        case "Training tool":
//            Text("🏋️ Training Tool Screen")
//            
//        case "BMR Calculator":
//            BMRCalculatorView()
//            
//        case "Body Fat Calculator":
//            Text("🏋️ Training Tool Screen")
//
////            BodyFatCalculatorView()
//            
//        case "Goal Calculator":
//            LottieNGoalView()
//            
//        case "Macro Calculator":
//            VStack {
//                FoodCategoryGridView()
//                Text("🥗 Macro Calculator Screen")
//            }
//            
//        case "Calorie Calculator":
//            VStack {
//                MacroCalculatorView()
//            }
//            
//        case "1RM Calculator":
//            Text("💪 1RM Calculator Screen")
//            
//        case "Reminders":
//            ClientReminderView()
//            
//        case "Water Intake":
//            WaterIntakeView()
//            
//        case "Exercise Info":
//            ExerciseCalorieBurnView()
//            
//        case "BMI Calculator":
//            BMICalculatorView()
//        case "Food Info":
//            MyFruitsListView()
//        default:
//            Text("🚧 Coming Soon!")
//        }
//    }
//}
//
//#Preview {
//    ToolsViews()
//}

import SwiftUI
import SwiftData

struct ToolsViews: View {
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = ToolsViewModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.tools) { tool in
                        NavigationLink(destination: destinationView(for: tool)) {
                            VStack(spacing: 12) {
                                Image(systemName: tool.iconName)
                                    .font(.system(size: 30))
                                    .foregroundColor(tool.iconColor)
                                Text(tool.name)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.primary)
                            }
                            .frame(maxWidth: .infinity, minHeight: 100)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("⚙️ Tools")
        }
    }
    
    @ViewBuilder
    private func destinationView(for tool: Tool) -> some View {
        switch tool.name {
        case "Personal Work": PersonalWorkView()
        case "HealthKit": Text("❤️ HealthKit Screen")
        case "Diet tool": Text("🍎 Diet Tool Screen")
        case "Training tool": Text("🏋️ Training Tool Screen")
        case "BMR Calculator": BMRCalculatorView()
        case "Body Fat Calculator": Text("🏋️ Body Fat Calculator")
        case "Goal Calculator": LottieNGoalView()
        case "Macro Calculator": VStack {
            FoodCategoryGridView()
            Text("🥗 Macro Calculator Screen")
        }
        case "Calorie Calculator": MacroCalculatorView()
        case "1RM Calculator": Text("💪 1RM Calculator Screen")
        case "Reminders": ClientReminderView()
        case "Water Intake": WaterIntakeView()
        case "Exercise Info": ExerciseCalorieBurnView()
        case "BMI Calculator": BMICalculatorView()
        case "Food Info": MyFruitsListView()
        default: Text("🚧 Coming Soon!")
        }
    }
}

#Preview{
    ToolsViews()
}
