//
//  HorizontalModules.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct HorizontalModules: View {
    var category: Category
    @Binding var currentSelected: String
    var isSentence: Bool {
        category.typeEnum == .situation
    }
    
    var courses: [Course] {
        category.courses!.array as! [Course]
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(courses, id: \.self) { course in
                    PhraseButton(practiceDone: course.completionState == 1, isSelected: course.name! == currentSelected, isSentence: isSentence, phrase: course.name!) {
                        self.currentSelected = course.name!
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
