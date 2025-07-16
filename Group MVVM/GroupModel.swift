//
//  GroupModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 28/04/25.
//

import Foundation

struct Group2: Identifiable {
    let id: Int
    let name: String
    let location: String
    let imageName: String
    let isPaid: Bool
    let members: Int
    let isFull: Bool
}
