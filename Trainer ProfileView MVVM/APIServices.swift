//
//  APIServices.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 25/06/25.
//

import Foundation

class DataLoader {
    static func loadFruits() -> [MyFruits] {
        guard let url = Bundle.main.url(forResource: "MockData", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let fruits = try? JSONDecoder().decode([MyFruits].self, from: data)
        else {
            return []
        }
        return fruits
    }
}
