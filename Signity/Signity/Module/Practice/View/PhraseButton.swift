//
//  PhraseButton.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct PhraseButton: View {
    var practiceDone = false
    var isSelected = false
    var isSentence = true
    var phrase: String
    var action: () -> Void
    
    var width: CGFloat {
        if isSentence {
            return isSelected ? 260 : 220
        } else {
            return isSelected ? 48 : 40
        }
    }
    var height: CGFloat {
        if isSentence {
            return isSelected ? 60 : 50
        } else {
            return isSelected ? 48 : 40
        }
    }
    var backgroundColor: Color {
        practiceDone ? Color("FeedbackCorrect") : Color.white
    }
    var textColor: SignityTextColor {
        practiceDone ? .white : .darkPurple
    }
    
    var body: some View {
        Button(phrase, action: action)
            .frame(width: width, height: height)
            .background(backgroundColor)
            .cornerRadius(13)
            .opacity(0.8)
            .modifier(SignitySubtitle(color: textColor))
    }
}


struct PhraseButton_Previews: PreviewProvider {
    static var previews: some View {
        PhraseButton(phrase: "Selamat Pagi", action: {})
            .preferredColorScheme(.dark)
    }
}
