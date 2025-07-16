//
//  PersonalWorkViewModel.swift
//  Fitness App In SwiftUI
//
//  Created by Sainath bamen on 30/04/25.
//

import SwiftUI
import SwiftData

class PersonalWorkViewModel: ObservableObject {
    @Published var newWorkTitle: String = ""
    @Published var newWorkSets: String = "" // 👈 New property for sets
    @Published var works: [PersonalWork] = []

    var context: ModelContext!

    func fetchWorks() {
        guard let context = context else { return }
        let descriptor = FetchDescriptor<PersonalWork>()
        if let result = try? context.fetch(descriptor) {
            self.works = result
        }
    }

    func addWork() {
        guard let context = context,
              !newWorkTitle.isEmpty,
              let sets = Int(newWorkSets), sets > 0 else { return }
        
        let newWork = PersonalWork(title: newWorkTitle, sets: sets)
        context.insert(newWork)
        try? context.save()
        fetchWorks()
        
        newWorkTitle = ""
        newWorkSets = ""
    }

    func deleteWork(at offsets: IndexSet) {
        guard let context = context else { return }
        for index in offsets {
            let workToDelete = works[index]
            context.delete(workToDelete)
        }
        try? context.save()
        fetchWorks()
    }
}
