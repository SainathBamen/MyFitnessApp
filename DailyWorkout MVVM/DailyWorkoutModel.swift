//
//  DailyWorkoutModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 21/06/25.
//

import SwiftUI
import SwiftData

@Model
class Workout {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

