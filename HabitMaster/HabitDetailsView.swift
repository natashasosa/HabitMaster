//
//  HabitDetailsView.swift
//  HabitMaster
//
//  Created by Natasha Rebelo on 29/08/23.
//


import SwiftUI

struct HabitDetailsView: View {
    let title: String
    let description: String
    var completionGoal: Int
    @State var completionCount: Int

    @State var isGoalDone = false

    var body: some View {
        NavigationView {
            VStack {
                Text(title)
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                HStack {
                    Text(description)

                    Spacer()
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(.white)
                .foregroundColor(.accentText)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .accentText, radius: 2)

                HStack {
                    Text("\(completionCount)/\(completionGoal)")
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
                        addCompletionCount()
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
    func addCompletionCount() {
        if completionCount < completionGoal {
            completionCount += 1
        }
        if completionCount == completionGoal {
            isGoalDone = true
        }
    }
}

struct HabitDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailsView(title: "Habit Title", description: "Habit Description", completionGoal: 30, completionCount: 0)
    }
}
