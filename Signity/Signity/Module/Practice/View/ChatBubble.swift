//
//  ChatBubble.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct ChatBubble : View {
    var text: String
    
    var body: some View {
        HStack {
            Text(text)
                .padding(.all, 15)
                .padding(.trailing, 10)
                .background(Color.white)
                .opacity(0.85)
                .modifier(PhraseStyle())
                .multilineTextAlignment(.leading)
                .clipShape(ChatTriangleShape())
        }
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(text: "Selamat pagi")
            .preferredColorScheme(.dark)
    }
}
