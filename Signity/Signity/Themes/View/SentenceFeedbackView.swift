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
    @State var animate = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .background(Color.white)
                .cornerRadius(13)
                .opacity(0.6)
            HStack {
                ForEach(words.indices) { i in
                    Text(words[i])
                        .foregroundColor(i < currentCorrect ? Color("Green") : Color("DarkPurple"))
                }
            }
            .modifier(PhraseStyle())
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: 50)
        .animation(.linear, value: animate)
        .onAppear {
            self.animate.toggle()
        }
    }
}

struct SentenceFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        SentenceFeedbackView()
            .preferredColorScheme(.dark)
    }
}
