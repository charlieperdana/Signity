//
//  SignityButtonOutline.swift
//  Signity
//
//  Created by Andrean Lay on 12/08/21.
//

import SwiftUI

struct SignityButtonOutline: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(text)
                    .modifier(SignityHeadline(color: .button))
                Spacer()
            }
            .padding()
            .foregroundColor(.blue)
            .overlay(
                RoundedRectangle(cornerRadius: 13)
                    .stroke(Color("Button")))
            
        }
    }
}

struct SignityButtonOutline_Previews: PreviewProvider {
    static var previews: some View {
        SignityButtonOutline(text: "Pernah, saya mengerti BISINDO", action: {})
    }
}
