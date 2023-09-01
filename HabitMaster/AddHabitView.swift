//
//  AddHabitView.swift
//  HabitMaster
//
//  Created by Natasha Rebelo on 30/08/23.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habitManager: HabitManager
    @Environment(\.dismiss) var dismiss

    @State var title = ""
    @State var description = ""
    @State var completionGoal = 0

    var completionHandler: ((String, String, Int) -> Void)?

    var body: some View {
        NavigationView {
            VStack {
                Text("New Habit")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.accentText)

                Form {
                    Section(header: Text("TITLE")){
                        TextField("Title", text: $title)
                    }
                    
                    Section(header: Text("BRIEF DESCRIPTION")){
                        TextField("Description", text: $description)
                    }
                    
                    Section(header: Text("COMPLETION GOAL (IN DAYS)")){
                        TextField("Completion Goal", value: $completionGoal, formatter: NumberFormatter())
                    }
                }
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                .foregroundColor(.accentText)
                .background(.accentBackground)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .ignoresSafeArea()

                .toolbar {
                    Button("Add") {
                        let habit = Habit(title: title, description: description, completionGoal: completionGoal)
                        habitManager.habits.insert(habit, at: 0)
                        dismiss()
                    }
                    .foregroundColor(.accentText)
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habitManager: HabitManager())
    }
}
