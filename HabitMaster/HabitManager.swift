//
//  HabitManager.swift
//  HabitMaster
//
//  Created by Natasha Rebelo on 29/08/23.
//

import Foundation
import SwiftUI

/*class HabitManager: ObservableObject {
    @Published var habits: [Habit] = [
    Habit(title: "Drink water", description: "Drink 2L of water everyday for the next 30 days.", completionGoal: 30),
    Habit(title: "Work Out", description: "Do at least 20 minutes of exercise a day for the next 10 days", completionGoal: 10),
    Habit(title: "Read", description: "Read at least 10 pages of a book for the next 15 days", completionGoal: 15),
    Habit(title: "Code", description: "Practice coding for at least one hour for the next 60 days", completionGoal: 60),
    Habit(title: "Play piano", description: "Practice playig the piano for at least 30 minutes", completionGoal: 20),
    Habit(title: "Study french", description: "Do grammar and vocabulary exercises or watching content in french", completionGoal: 30)
    ]
}*/
class HabitManager: ObservableObject {
    @Published var habits: [Habit] {
        didSet {
            let encoder = JSONEncoder()
            if let encodedHabits = try? encoder.encode(habits) {
                UserDefaults.standard.set(encodedHabits, forKey: "Habits")
            }
        }
    }

    init() {
        if let habitsData = UserDefaults.standard.data(forKey: "Habits") {
            let decoder = JSONDecoder()
            if let decodedHabits = try? decoder.decode([Habit].self, from: habitsData) {
                self.habits = decodedHabits
                return
            }
        }

        self.habits = [
            Habit(title: "Drink water", description: "Drink 2L of water everyday for the next 30 days.", completionGoal: 30),
            Habit(title: "Work Out", description: "Do at least 20 minutes of exercise a day for the next 10 days", completionGoal: 10),
            Habit(title: "Read", description: "Read at least 10 pages of a book for the next 15 days", completionGoal: 15),
            Habit(title: "Code", description: "Practice coding for at least one hour for the next 60 days", completionGoal: 60),
            Habit(title: "Skin care", description: "Do skin care routine every morning", completionGoal: 20),
            Habit(title: "Study", description: "Study a lenguage or new subject for 30 minutes", completionGoal: 30)
        ]
    }
}
