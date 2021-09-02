//
//  SituationHorizontalModule.swift
//  Signity
//
//  Created by Andrean Lay on 23/08/21.
//

import SwiftUI

struct SituationHorizontalModule: View {
    var category: Category
    @Binding var currentSelected: Course
    var currentIndex: Int
    var currentCorrect: [Int]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { scrollValue in
                HStack {
                    ForEach(category.courses.indices, id: \.self) { i in
                        let course = category.courses[i]
                        
                        SentencePracticeView(isSelected: i == currentIndex, practiceDone: course.completionState == 1, words: course.wordParts, currentCorrect: currentCorrect[i]) {
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
