//
//  Habit.swift
//  HabitMaster
//
//  Created by Natasha Rebelo on 29/08/23.
//

import Foundation

struct Habit: Identifiable, Codable {
    let id = UUID()
    let title: String
    let description: String
    var completionGoal: Int
    var completionCount: Int = 0

    mutating func addCompletionCount() {
        if completionCount < completionGoal {
            completionCount += 1
        }
    }
}
