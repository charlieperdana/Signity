//
//  SentencePracticeView.swift
//  Signity
//
//  Created by Andrean Lay on 23/08/21.
//

import SwiftUI

struct SentencePracticeView: View {
    var isSelected: Bool
    var practiceDone: Bool
    
    var words: [String]
    var currentCorrect: Int
    var action: () -> Void
    
    var width: CGFloat {
        return isSelected ? 260 : 220
    }
    var height: CGFloat {
        return isSelected ? 60 : 50
    }
    var backgroundColor: Color {
        practiceDone ? Color("FeedbackCorrect") : Color.white
    }
    var textColor: SignityTextColor {
        practiceDone ? .white : .darkPurple
    }
    
    var body: some View {
        ZStack {
            Rectangle()
            
            HStack {
                ForEach(words.indices, id: \.self) { i in
                    if practiceDone {
                        Text(words[i])
                    } else {
                        Text(words[i])
                            .foregroundColor(i < currentCorrect ? Color("FeedbackCorrect") : Color("DarkPurple"))
                    }
                }
            }
            .modifier(SignitySubtitle(color: textColor))
        }
        .onTapGesture(perform: action)
        .frame(width: width, height: height)
        .contentShape(Rectangle())
        .background(backgroundColor)
        .cornerRadius(13)
    }
}

struct SentencePracticeView_Previews: PreviewProvider {
    static var previews: some View {
        SentencePracticeView(isSelected: false, practiceDone: true, words: ["Halo", "Selamat Siang"], currentCorrect: 1, action: {})
            .preferredColorScheme(.dark)
    }
}
