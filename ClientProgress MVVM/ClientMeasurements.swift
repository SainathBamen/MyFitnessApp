//
//  ClientMeasurements.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 08/07/25.
//


import SwiftData
import SwiftUI


@Model
class ClientMeasurement {
    @Attribute(.unique) var id: UUID
    var weight: Double
    var waist: Double
    var thigh: Double
    var date: Date

    init(weight: Double, waist: Double, thigh: Double, date: Date) {
        self.id = UUID()
        self.weight = weight
        self.waist = waist
        self.thigh = thigh
        self.date = date
    }
}
