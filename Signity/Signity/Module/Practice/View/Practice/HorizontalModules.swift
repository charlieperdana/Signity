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
    @Binding var currentSelected: String
    var isSentence: Bool {
        category.typeEnum == .situation
    }
    
    var courses: [Course] {
        (category.courses!.array as? [Course]) ?? []
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(courses, id: \.self) { course in
                    if let courseName = course.name {
                        PhraseButton(practiceDone: course.completionState == 1, isSelected: courseName == currentSelected, isSentence: isSentence, phrase: courseName) {
                            self.currentSelected = courseName
                        }
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
