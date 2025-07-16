//
//  AppTrainersView.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 03/07/25.
//

import SwiftUI

// MARK: - Trainer Model
struct Trainer: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let qualification: String
    let specialization: String
    let experience: String
    let charges: Int
    let imageName: String
}

// MARK: - Sample Data
let trainers = [
    Trainer(name: "Sainath Bamen", age: 28, qualification: "B.Sc. in Sports Science", specialization: "Strength & Conditioning", experience: "Sainath has over 5 years of experience in fitness training. He specializes in improving muscle strength, endurance and mobility.", charges: 2500, imageName: "trainer1"),
    
    Trainer(name: "Sneha Patil", age: 25, qualification: "Diploma in Yoga Therapy", specialization: "Hatha & Power Yoga", experience: "Sneha has 4+ years of experience in yoga therapy. She conducts personalized yoga sessions for stress relief, flexibility and posture correction.", charges: 2200, imageName: "trainer2"),
    
    Trainer(name: "Amit Desai", age: 32, qualification: "M.Sc. in Exercise Physiology", specialization: "Functional Training", experience: "Amit has 7 years of experience in functional fitness and rehab training. Expert in posture correction and injury recovery plans.", charges: 2800, imageName: "trainer3"),
    
    Trainer(name: "Priya More", age: 27, qualification: "Diploma in Personal Training", specialization: "Zumba & Cardio Training", experience: "Priya has 6 years of experience in high-energy cardio and Zumba fitness sessions. Conducted 500+ group sessions.", charges: 2000, imageName: "trainer4"),
    
    Trainer(name: "Karan Bhosle", age: 30, qualification: "Certified CrossFit Trainer", specialization: "CrossFit & HIIT", experience: "Karan has 8 years of CrossFit coaching experience. Expert in high-intensity interval training and powerlifting routines.", charges: 3000, imageName: "trainer5"),
    
    Trainer(name: "Nisha Chavan", age: 26, qualification: "M.A. in Yoga & Naturopathy", specialization: "Therapeutic Yoga", experience: "Nisha has 6+ years of experience in therapeutic yoga for managing stress, arthritis and chronic pain. Also conducts prenatal yoga.", charges: 2100, imageName: "trainer6"),
    
    Trainer(name: "Rohit Pawar", age: 29, qualification: "ACE Certified Personal Trainer", specialization: "Bodybuilding & Weight Training", experience: "Rohit has 7 years of bodybuilding coaching experience. Specialist in hypertrophy training, fat loss and sports nutrition.", charges: 2700, imageName: "trainer7"),
    
    Trainer(name: "Anjali Kale", age: 24, qualification: "Diploma in Pilates", specialization: "Pilates & Core Training", experience: "Anjali has 5+ years of expertise in Pilates and mat workouts. Focus on postural alignment, flexibility and injury rehab.", charges: 2300, imageName: "trainer8"),
    
    Trainer(name: "Manoj Deshmukh", age: 31, qualification: "B.P.Ed.", specialization: "Martial Arts & Self Defense", experience: "Manoj has 9 years of martial arts training. Black belt in Taekwondo, trained in Muay Thai and Boxing. Expert in self-defense workshops.", charges: 2900, imageName: "trainer9"),
    
    Trainer(name: "Shruti Salunkhe", age: 27, qualification: "Diploma in Sports Nutrition", specialization: "Diet & Fitness Coaching", experience: "Shruti has 6 years of experience in diet and fitness counseling. Prepares customized diet plans and integrates mindfulness sessions.", charges: 2200, imageName: "trainer10")
]


// MARK: - AppTrainersView
struct AppTrainersView: View {
    @State private var expandedTrainerIDs: Set<UUID> = []

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(trainers) { trainer in
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 16) {
                                // ✅ Custom Image
                                Image(trainer.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                                    .shadow(radius: 3)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(trainer.name)
                                        .font(.title3)
                                        .fontWeight(.bold)

                                    Text("Age: \(trainer.age)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                    Text("Charges: ₹\(trainer.charges)")
                                        .font(.subheadline)
                                        .foregroundColor(.green)
                                }

                                Spacer()

                                Button(action: {
                                    withAnimation {
                                        if expandedTrainerIDs.contains(trainer.id) {
                                            expandedTrainerIDs.remove(trainer.id)
                                        } else {
                                            expandedTrainerIDs.insert(trainer.id)
                                        }
                                    }
                                }) {
                                    Image(systemName: expandedTrainerIDs.contains(trainer.id) ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                                        .font(.title2)
                                        .foregroundColor(.blue)
                                }
                            }

                            if expandedTrainerIDs.contains(trainer.id) {
                                Divider()

                                VStack(alignment: .leading, spacing: 6) {
                                    HStack {
                                        Text("🎓 Qualification:")
                                            .fontWeight(.semibold)
                                        Text(trainer.qualification)
                                    }

                                    HStack {
                                        Text("🏋️‍♂️ Specialization:")
                                            .fontWeight(.semibold)
                                        Text(trainer.specialization)
                                    }

                                    Text("📌 Experience:")
                                        .fontWeight(.semibold)

                                    Text(trainer.experience)
                                        .font(.body)
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(.top, 4)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                        )
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(.systemGray6), Color(.systemGray5)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .navigationTitle("🏋️‍♂️ Hire Trainers")
        }
    }
}

// MARK: - Preview
#Preview {
    AppTrainersView()
}
