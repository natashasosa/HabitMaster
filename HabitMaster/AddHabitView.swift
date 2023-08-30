//
//  AddHabitView.swift
//  HabitMaster
//
//  Created by Natasha Rebelo on 30/08/23.
//

import SwiftUI

struct AddHabitView: View {
    @State var title = ""
    @State var description = ""
    @State var completionGoal = 0

    var completionHandler: ((String, String, Int) -> Void)?

    var body: some View {
        NavigationView {
            Form {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    TextField("Completion Goal", value: $completionGoal, formatter: NumberFormatter())
            }
            .navigationBarItems(trailing:
                Button("Add") {
                    completionHandler?(title, description, completionGoal)
                }
            )
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView()
    }
}
