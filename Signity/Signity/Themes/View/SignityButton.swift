//
//  SignityButton.swift
//  Signity
//
//  Created by Andrean Lay on 11/08/21.
//

import SwiftUI

struct SignityButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(text)
                    .modifier(SignityHeadline(color: .white))
                Spacer()
                
            }
            .padding()
            .foregroundColor(.white)
            .background(Color("Button"))
            .cornerRadius(13)
        }
    }
}

struct SignityButton_Previews: PreviewProvider {
    static var previews: some View {
        SignityButton(text: "Mulai Latihan", action: {})
    }
}
