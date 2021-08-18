//
//  HorizontalModules.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

//TODO:
//1. Put selected word in the middle
//

struct HorizontalModules: View {
    var category: Category
    @Binding var currentSelected: Course
    var isSentence: Bool {
        category.typeEnum == .situation
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(category.courses, id: \.self) { course in
                    PhraseButton(practiceDone: course.completionState == 1, isSelected: course == currentSelected, isSentence: !category.isCharacter, phrase: course.name) {
                        self.currentSelected = course
                    }

                }
            }
        }
        .padding(.bottom, 40)
    }
}

//struct HorizontalModules_Previews: PreviewProvider {
//    static var previews: some View {
//        HorizontalModules(viewModel: PracticeViewModel())
//    }
//}
