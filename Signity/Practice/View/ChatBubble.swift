//
//  ChatBubble.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct ChatBubble<Content>: View where Content: View {
    let content: () -> Content
    
    var body: some View {
        HStack {
            content()
                .clipShape(ChatTriangleShape())
        }
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble() {
            Text("Good morning")
                .padding(.all, 15)
                .padding(.trailing, 10)
                .background(Color.white)
                .opacity(0.85)
                .modifier(PhraseStyle())
                .multilineTextAlignment(.leading)
        }
        .preferredColorScheme(.dark)
    }
}
