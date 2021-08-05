//
//  PhraseButton.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct LetterButton: View {
    var practiceDone = true
    var isCurrentLetter = false
    var letter: Character
    var action: () -> Void
    
    var size: CGFloat {
        isCurrentLetter ? 48 : 40
    }
    var backgroundColor: Color {
        practiceDone ? Color("Green") : Color.white
    }
    var textColor: Color {
        practiceDone ? Color.white : Color("DarkPurple")
    }
    
    var body: some View {
        Button(String(letter), action: action)
        .frame(width: size, height: size)
        .font(.title2.bold())
        .background(backgroundColor)
        .cornerRadius(13)
        .opacity(0.8)
        .foregroundColor(textColor)
    }
}

struct PhraseButton_Previews: PreviewProvider {
    static var previews: some View {
        LetterButton(letter: "B", action: {})
            .preferredColorScheme(.dark)
    }
}
