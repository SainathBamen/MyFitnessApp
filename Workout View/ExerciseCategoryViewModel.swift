//
//  ExerciseCategoryViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 09/07/25.
//

import SwiftUI

class ExerciseViewModel: ObservableObject {
    @Published var categories: [ExerciseCategory] = [
        
        // Chest
        ExerciseCategory(title: "Chest Exercises", exercises: [
            "Barbell Bench Press", "Dumbbell Bench Press", "Incline Bench Press", "Decline Bench Press", "Push-Ups",
            "Chest Dips", "Cable Crossover", "Dumbbell Flyes", "Pec Deck Machine", "Incline Dumbbell Fly"
        ]),
        
        // Biceps
        ExerciseCategory(title: "Biceps Exercises", exercises: [
            "Barbell Curl", "Dumbbell Curl", "Hammer Curl", "Preacher Curl", "Concentration Curl",
            "Cable Curl", "EZ Bar Curl", "Incline Dumbbell Curl", "Zottman Curl", "Chin-Ups"
        ]),
        
        // Triceps
        ExerciseCategory(title: "Triceps Exercises", exercises: [
            "Close-Grip Bench Press", "Tricep Dips", "Tricep Pushdown (Cable)", "Skull Crushers", "Overhead Dumbbell Extension",
            "Rope Pushdown", "Kickbacks", "Diamond Push-Ups", "One-Arm Overhead Extension", "EZ Bar Skull Crusher"
        ]),
        
        // Shoulders
        ExerciseCategory(title: "Shoulder Exercises", exercises: [
            "Overhead Barbell Press", "Dumbbell Shoulder Press", "Arnold Press", "Lateral Raise", "Front Raise",
            "Rear Delt Fly", "Barbell Upright Row", "Cable Lateral Raise", "Seated Dumbbell Press", "Shrugs"
        ]),
        
        // Back
        ExerciseCategory(title: "Back Exercises", exercises: [
            "Deadlifts", "Pull-Ups", "Lat Pulldown", "Barbell Row", "T-Bar Row",
            "Seated Cable Row", "Dumbbell Row", "Face Pull", "Hyperextensions", "Single-Arm Lat Pulldown"
        ]),
        
        // Legs
        ExerciseCategory(title: "Leg Exercises", exercises: [
            "Barbell Squat", "Leg Press", "Lunges", "Romanian Deadlift", "Leg Extension",
            "Leg Curl", "Bulgarian Split Squat", "Goblet Squat", "Sumo Deadlift", "Calf Raises"
        ]),
        
        // Abs
        ExerciseCategory(title: "Abs Exercises", exercises: [
            "Crunches", "Leg Raises", "Plank", "Russian Twists", "Bicycle Crunch",
            "Cable Crunch", "V-Ups", "Mountain Climbers", "Hanging Leg Raise", "Reverse Crunch"
        ]),
        
        // Cardio
        ExerciseCategory(title: "Cardio Exercises", exercises: [
            "Running", "Cycling", "Jump Rope", "Burpees", "High Knees",
            "Mountain Climbers", "Jumping Jacks", "Rowing Machine", "Treadmill Sprints", "Box Jumps"
        ]),
        
        // Forearms
        ExerciseCategory(title: "Forearm Exercises", exercises: [
            "Barbell Wrist Curl", "Reverse Wrist Curl", "Dumbbell Wrist Curl", "Farmer's Walk", "Plate Pinch",
            "Towel Pull-Ups", "Wrist Roller", "Reverse Barbell Curl", "Grip Squeezes", "Static Holds"
        ]),
        
        // Calves
        ExerciseCategory(title: "Calf Exercises", exercises: [
            "Standing Calf Raise", "Seated Calf Raise", "Leg Press Calf Raise", "Donkey Calf Raise", "Single-Leg Calf Raise",
            "Smith Machine Calf Raise", "Jump Rope", "Weighted Calf Raise", "Tip-Toe Walking", "Squat Calf Raise"
        ])
    ]
}
