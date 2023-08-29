//
//  ContentView.swift
//  HabitMaster
//
//  Created by Natasha Rebelo on 24/08/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habitManager = HabitManager()

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
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(habitManager.habits) {habit in
                            NavigationLink {
                                HabitDetailsView()
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
