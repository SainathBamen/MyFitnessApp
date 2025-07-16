//
//  ClientsProfileViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 03/04/25.
//

import Foundation

//MARK: - ClientsProfileViewModel.

class ClientsProfileViewModel: ObservableObject{
    @Published var posts: [ClientsProfileModel] = [
        ClientsProfileModel(username: "Shakti Rana", profileImage: "trainerImg1", beforeAfterImage: "clientImg1", coachName: "Sainath"),
        ClientsProfileModel(username: "Amar Madhav", profileImage: "trainerImg2", beforeAfterImage: "clientImg2", coachName: "Akshay"),
        ClientsProfileModel(username: "Sanket Patil", profileImage: "trainerImg3", beforeAfterImage: "clientImg3", coachName: "Uday"),
        ClientsProfileModel(username: "Sameer Kokate", profileImage: "trainerImg4", beforeAfterImage: "clientImg4", coachName: "Kishor"),
        ClientsProfileModel(username: "Mahesh Deshmukh", profileImage: "trainerImg1", beforeAfterImage: "clientImg5", coachName: "Sainath"),
        ClientsProfileModel(username: "Jitesh Bhoir", profileImage: "trainerImg2", beforeAfterImage: "clientImg6", coachName: "Pratap"),
        ClientsProfileModel(username: "Mukesh", profileImage: "trainerImg3", beforeAfterImage: "clientImg7", coachName: "Nimisha"),
        ClientsProfileModel(username: "Ram", profileImage: "trainerImg4",  beforeAfterImage: "clientImg8", coachName: "Sanskar"),
        ClientsProfileModel(username: "Ram", profileImage: "trainerImg1",  beforeAfterImage: "clientImg9", coachName: "Sanskar"),
        ClientsProfileModel(username: "Ram", profileImage: "trainerImg2",  beforeAfterImage: "clientImg10", coachName: "Sanskar")
    ]
}
