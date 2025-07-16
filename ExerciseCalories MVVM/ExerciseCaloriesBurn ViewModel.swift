//
//  ExerciseCaloriesBurn ViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 16/07/25.
//

import SwiftUI

// MARK: - Sample Data

let sampleExercises: [Exercise] = [
    Exercise(name: "Running (6 mph)", caloriesPerHour: 600,
             description: "Running at 6 mph is a great cardiovascular exercise that significantly improves heart and lung function. It helps burn body fat, boosts stamina, and enhances mental health through the release of endorphins. It's ideal for people looking for weight loss and endurance training.",
             image: ""),

    Exercise(name: "Cycling (moderate)", caloriesPerHour: 500,
             description: "Moderate cycling is low-impact, making it easy on joints while still offering a good cardio workout. It strengthens your calves, thighs, and glutes, and improves cardiovascular endurance. It’s suitable for beginners and can be done both indoors and outdoors.",
             image: ""),

    Exercise(name: "Swimming (freestyle)", caloriesPerHour: 550,
             description: "Swimming is a full-body workout that engages muscles from head to toe. It improves heart health, builds stamina, and increases muscle strength. It’s especially helpful for those with joint pain since it’s a no-impact activity.",
             image: ""),

    Exercise(name: "Jump Rope", caloriesPerHour: 700,
             description: "Jumping rope is a powerful cardio workout that boosts coordination, agility, and footwork. It rapidly burns calories and is perfect for short, high-intensity workouts. Great for boxers, athletes, and fitness enthusiasts.",
             image: ""),

    Exercise(name: "HIIT Workout", caloriesPerHour: 750,
             description: "HIIT involves short bursts of intense exercise followed by short recovery periods. It raises your heart rate quickly, improves metabolism, and continues burning calories even after the workout. Great for fat loss and time-efficient workouts.",
             image: ""),

    Exercise(name: "Yoga", caloriesPerHour: 200,
             description: "Yoga focuses on flexibility, strength, and mindfulness. It reduces stress, increases mobility, and enhances breathing. Perfect for recovery days or combining with strength/cardio workouts.",
             image: ""),

    Exercise(name: "Pilates", caloriesPerHour: 250,
             description: "Pilates is great for strengthening the core, improving balance and posture, and toning the body. It emphasizes control and precision and is good for injury prevention and rehabilitation.",
             image: ""),

    Exercise(name: "Dancing", caloriesPerHour: 400,
             description: "Dancing is not just fun but also a high-energy cardio workout. It improves coordination, burns calories, and uplifts mood. Whether it’s freestyle, Bollywood, or hip-hop, it’s a great stress buster.",
             image: ""),

    Exercise(name: "Rowing Machine", caloriesPerHour: 600,
             description: "Rowing offers a full-body workout that targets the back, arms, legs, and core. It improves endurance, posture, and cardiovascular strength while being joint-friendly.",
             image: ""),

    Exercise(name: "Hiking", caloriesPerHour: 450,
             description: "Hiking combines the benefits of walking with resistance training as you climb hills and navigate terrain. It improves leg strength, lung capacity, and mental well-being by connecting with nature.",
             image: ""),

    Exercise(name: "Kickboxing", caloriesPerHour: 650,
             description: "Kickboxing is a high-intensity workout that involves punches and kicks. It improves strength, coordination, reflexes, and heart health. It’s also great for releasing stress and learning self-defense.",
             image: ""),

    Exercise(name: "Stair Climbing", caloriesPerHour: 500,
             description: "Climbing stairs builds lower body strength, especially in glutes, quads, and calves. It’s a simple but effective cardio workout that helps with fat loss and leg toning.",
             image: ""),

    Exercise(name: "Basketball", caloriesPerHour: 600,
             description: "Playing basketball enhances agility, coordination, and speed. It's a fast-paced sport that improves hand-eye coordination, cardio fitness, and builds muscle strength, especially in legs and upper body.",
             image: ""),

    Exercise(name: "Soccer", caloriesPerHour: 650,
             description: "Soccer involves continuous running, sprinting, and agility drills. It improves cardiovascular health, builds stamina, and enhances leg and core strength. It’s also great for teamwork and coordination.",
             image: ""),

    Exercise(name: "Tennis", caloriesPerHour: 550,
             description: "Tennis is a dynamic sport that combines agility, speed, and power. It improves reaction time, muscle coordination, and cardiovascular fitness. Excellent for full-body engagement and mental alertness.",
             image: ""),

    Exercise(name: "Weight Lifting", caloriesPerHour: 300,
             description: "Weightlifting builds muscle mass, boosts metabolism, strengthens bones, and supports fat loss. It also improves posture and functional strength for daily life activities.",
             image: ""),

    Exercise(name: "Zumba", caloriesPerHour: 500,
             description: "Zumba is a dance-based cardio workout that blends fun with fitness. It improves endurance, burns calories, and helps tone the body while keeping motivation high with music and choreography.",
             image: ""),

    Exercise(name: "Elliptical Trainer", caloriesPerHour: 550,
             description: "Elliptical training is low-impact, ideal for cardio without stressing joints. It works both the upper and lower body and is great for endurance and calorie burning.",
             image: ""),

    Exercise(name: "Skating", caloriesPerHour: 600,
             description: "Skating improves balance, coordination, and leg strength. It’s fun, efficient, and helps tone the lower body while offering a great aerobic workout.",
             image: ""),

    Exercise(name: "Walking (brisk)", caloriesPerHour: 300,
             description: "Brisk walking is accessible, joint-friendly, and improves heart health, mood, and blood sugar levels. It’s ideal for beginners and can be easily included in daily routines.",
             image: "")
]
