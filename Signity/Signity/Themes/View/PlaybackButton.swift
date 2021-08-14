//
//  PlaybackButton.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI

enum PlaybackState {
    case normal
    case slow
}

struct PlaybackButton: View {
    var state: PlaybackState
    var onClick: () -> Void
    
    var image: String {
        state == .slow ? "hare" : "tortoise"
    }
    var label: String {
        state == .slow ? "Normal" : "Slow"
    }
    
    var body: some View {
        Button(action: onClick, label: {
            HStack(spacing: 5) {
                Image(systemName: image)
                Text(label)
            }
        })
        .padding(.all, 5)
        .font(.headline)
        .background(Color("Button"))
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

struct PlaybackButton_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackButton(state: .normal, onClick: {})
    }
}
