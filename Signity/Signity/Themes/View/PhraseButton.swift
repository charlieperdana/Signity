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
            return isSelected ? 250 : 200
        } else {
            return isSelected ? 48 : 40
        }
    }
    var height: CGFloat {
        if isSentence {
            return isSelected ? 50 : 40
        } else {
            return isSelected ? 48 : 40
        }
    }
    var backgroundColor: Color {
        practiceDone ? Color("Green") : Color.white
    }
    var textColor: Color {
        practiceDone ? Color.white : Color("DarkPurple")
    }
    
    var body: some View {
        Button(phrase, action: action)
            .frame(width: width, height: height)
//            .font(.title2.bold())
            .background(backgroundColor)
            .cornerRadius(13)
            .opacity(0.8)
            .foregroundColor(textColor)
    }
}

struct PhraseButton_Previews: PreviewProvider {
    static var previews: some View {
        PhraseButton(phrase: "Selamat Pagi", action: {})
            .preferredColorScheme(.dark)
    }
}
