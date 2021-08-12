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
                    .fontWeight(.bold)
                    .font(.system(size: 17))
                    .foregroundColor(Color("MainPurple"))
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .padding()
            .foregroundColor(.blue)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 13)
                    .stroke(Color("MainPurple")))
            
        }
    }
}

struct SignityButtonOutline_Previews: PreviewProvider {
    static var previews: some View {
        SignityButtonOutline(text: "Pernah, saya mengerti BISINDO", action: {})
    }
}
