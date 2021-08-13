//
//  MultipleColumnView.swift
//  Signity
//
//  Created by Andrean Lay on 11/08/21.
//

import SwiftUI

struct GridView: View {
    var category: Category
    
    var numOfColumn: Int {
        category.isCharacter && category.typeEnum == .basic ? 5 : 1
    }

    var items: [GridItem] {
        Array(repeating: .init(.flexible(minimum: 0, maximum: .infinity)), count: numOfColumn)
    }
    
    var body: some View {
        LazyVGrid(columns: items, alignment: .center, spacing: 15) {
            ForEach(category.courses.indices) { i in
                NavigationLink(destination: TutorialPhraseView(category: category, chosenWord: category.courses[i].name)) {
                    CourseCell(course: category.courses[i], isEven: i % 2 == 0)
                }
            }
        }
    }
}

struct MultipleColumnView_Previews: PreviewProvider {
    static var previews: some View {
        return GridView(category: Category())
    }
}
