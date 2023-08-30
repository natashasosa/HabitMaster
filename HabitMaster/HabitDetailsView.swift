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
    var completionCount: Int
    
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.horizontal, .bottom])
            .background(.cardBackground)
            
        }
    }
}

struct HabitDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailsView(title: "Habit Title", description: "Habit Description", completionGoal: 30, completionCount: 0)
    }
}
