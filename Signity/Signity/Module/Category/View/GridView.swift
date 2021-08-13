//
//  MultipleColumnView.swift
//  Signity
//
//  Created by Andrean Lay on 11/08/21.
//

import SwiftUI

struct GridView: View {
    var numOfColumn: Int
    var courses: [Course]

    var items: [GridItem] {
        Array(repeating: .init(.flexible(minimum: 0, maximum: .infinity)), count: numOfColumn)
    }
    
    var body: some View {
        LazyVGrid(columns: items, alignment: .center, spacing: 15) {
            ForEach(courses) { course in
                NavigationLink(destination: TutorialPhraseView(category: course.category, chosenWord: course.name)) {
                    CharacterCell(text: course.name)
                }
            }
        }
    }
}

struct MultipleColumnView_Previews: PreviewProvider {
    static var previews: some View {
        return GridView(numOfColumn: 5, courses: [])
    }
}
