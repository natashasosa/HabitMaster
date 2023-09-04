//
//  HabitDetailsView.swift
//  HabitMaster
//
//  Created by Natasha Rebelo on 29/08/23.
//


import SwiftUI

struct HabitDetailsView: View {
    @Binding var habit: Habit
    @State var isGoalDone = false

    var body: some View {
        NavigationView {
            VStack {
                Text(habit.title)
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                HStack {
                    Text(habit.description)

                    Spacer()
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(.white)
                .foregroundColor(.accentText)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .accentText, radius: 2)

                HStack {
                    Text("\(habit.completionCount)/\(habit.completionGoal)")
                        .font(.title.weight(.bold))
                    Text("days completed.")
                    Spacer()
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(.white)
                .foregroundColor(.accentText)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .accentText, radius: 2)

                Spacer()

                VStack {
                    Text("Did you practice this habit today?")
                        .font(.title2.weight(.bold))
                        .foregroundColor(.white)

                    Button("I dit it!") {
                        checkIfDone()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(.accentText)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.white)
                    .font(.title3 .weight(.bold))
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.horizontal, .bottom])
            .background(.cardBackground)

            .alert("Congratulations.", isPresented: $isGoalDone) {
                Button("OK") { }
            } message: {
                Text("You completed your goal for this habit. Great work!")
            }

        }
    }

    func checkIfDone() {
        if habit.completionCount < habit.completionGoal {
            habit.completionCount += 1
        }
        if habit.completionCount == habit.completionGoal {
            isGoalDone = true
        }
    }
}

struct HabitDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailsView(habit: .constant(Habit(title: "Sample Habit", description: "Sample Description", completionGoal: 10, completionCount: 5)))
    }
}
