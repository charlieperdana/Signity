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
                    .fontWeight(.bold)
                    .font(.system(size: 17))
                    .multilineTextAlignment(.center)
                Spacer()
                
            }
            .padding()
            .foregroundColor(.white)
            .background(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
            .cornerRadius(13)
        }
    }
}

struct SignityButton_Previews: PreviewProvider {
    static var previews: some View {
        SignityButton(text: "Mulai Latihan", action: {})
    }
}
