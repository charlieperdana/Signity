//
//  SignityButtonDisabled.swift
//  Signity
//
//  Created by Andrean Lay on 22/08/21.
//

import SwiftUI

struct SignityButtonDisabled: View {
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
            .background(Color("Button"))
            .cornerRadius(13)
        }
    }
}

struct SignityButtonDisabled_Previews: PreviewProvider {
    static var previews: some View {
        SignityButtonDisabled(text: "Allow camera permission", action: {})
    }
}
