//
//  ClientsProfileModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 03/04/25.
//

import Foundation

//MARK: - ClientsProfileModel

struct ClientsProfileModel: Identifiable{
    var id = UUID()
    var username: String
    var profileImage: String
    var beforeAfterImage: String
    var coachName: String
}



