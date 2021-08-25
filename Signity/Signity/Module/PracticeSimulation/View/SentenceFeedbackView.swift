//
//  SentenceFeedbackView.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI

struct SentenceFeedbackView: View {
    var words: [String]
    var currentCorrect: Int
    
    @State var animate = false
    
    var body: some View {
        HStack {
            ForEach(words.indices, id: \.self) { i in
                Text(words[i])
                    .foregroundColor(i < currentCorrect ? Color("FeedbackCorrect") : Color("DarkPurple"))
            }
        }
        .modifier(SignitySubtitle(color: .darkPurple))
        .frame(width: UIScreen.main.bounds.width - 30, height: 50)
        .background(Color.white)
        .cornerRadius(13)
        .opacity(0.9)
        .animation(.linear, value: animate)
        .onAppear {
            self.animate.toggle()
        }
    }
}

struct SentenceFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        SentenceFeedbackView(words: ["Halo", "selamat siang"], currentCorrect: 1)
            .preferredColorScheme(.light)
    }
}
