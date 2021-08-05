//
//  SentenceFeedbackView.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI

struct SentenceFeedbackView: View {
    var words = ["Selamat", "pagi"]
    @State var currentCorrect = 1
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 250, height: 50)
                .background(Color.white)
                .cornerRadius(13)
                .opacity(0.8)
            HStack {
                ForEach(words.indices) { i in
                    Text(words[i])
                        .foregroundColor(i < currentCorrect ? .green : Color("DarkPurple"))
                }
            }
            .modifier(PhraseStyle())
        }
    }
}

struct SentenceFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        SentenceFeedbackView()
            .preferredColorScheme(.dark)
    }
}
