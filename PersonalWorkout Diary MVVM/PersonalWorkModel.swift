//
//  PersonalWorkModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 30/04/25.
//

import SwiftUI
import SwiftData

@Model
class PersonalWork {
    var title: String
    var sets: Int

    init(title: String, sets: Int) {
        self.title = title
        self.sets = sets
    }
}
