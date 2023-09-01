//
//  ContentView.swift
//  HabitMaster
//
//  Created by Natasha Rebelo on 24/08/23.
//


import SwiftUI

struct ContentView: View {
    @StateObject var habitManager = HabitManager()
    @State var showingForm = false

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Habit Master")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.accentText)
                    .padding(.vertical)
                Spacer()
                ZStack {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(habitManager.habits) {habit in
                                NavigationLink {
                                    HabitDetailsView(title: habit.title, description: habit.description, completionGoal: habit.completionGoal, completionCount: habit.completionCount)
                                } label: {
                                    VStack {

                                        Text(habit.title)
                                            .font(.title2.weight(.bold))
                                            .foregroundColor(.white)
                                            .padding(.bottom, 5)

                                        Text(habit.description)
                                            .font(.body.weight(.medium))
                                            .foregroundColor(.accentText.opacity(0.8))

                                        Spacer()

                                        Text("\(habit.completionCount)/\(habit.completionGoal) done")
                                            .foregroundColor(.white)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, minHeight: 210)
                                    .background(.cardBackground)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(color: .accentText, radius: 2)
                            }
                            .padding(.all, 3)
                        }
                        .padding()
                    }
                    .background(.accentBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .ignoresSafeArea()

                    VStack {
                        Spacer()
                        HStack {
                            Spacer() // This will push the "+" button to the right
                            Button(action: {
                                showingForm = true
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.white.opacity(0.9))
                                    .padding(16)
                            }
                            .sheet(isPresented: $showingForm) { //chatWT
                                AddHabitView(habitManager: habitManager) { title, description, goal in
                                    let newHabit = Habit(title: title, description: description, completionGoal: goal)
                                    habitManager.habits.insert(newHabit, at: 0)
                                    showingForm = false
                                }
                            }

                            Spacer()
                        }
                        .background(.accentText)
                        .frame(maxWidth: .infinity, maxHeight: 20)
                    }
                }
            }
            .navigationTitle("Habit Master")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
