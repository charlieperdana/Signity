//
//  HorizontalModules.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct HorizontalModules: View {
    var category: Category
    @Binding var currentSelected: Course
    var currentIndex: Int

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { scrollValue in
                HStack {
                    ForEach(category.courses.indices, id: \.self) { i in
                        let course = category.courses[i]

                        PhraseButton(practiceDone: course.completionState == 1, isSelected: course == currentSelected, isSentence: !category.isCharacter, phrase: course.name) {
                            
                            self.currentSelected = course
                        }
                        .id(i)
                    }
                    .onChange(of: currentIndex) { index in
                        withAnimation {
                            scrollValue.scrollTo(index, anchor: .center)
                        }
                    }
                    .onAppear {
                        withAnimation {
                            scrollValue.scrollTo(currentIndex, anchor: .center)
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
