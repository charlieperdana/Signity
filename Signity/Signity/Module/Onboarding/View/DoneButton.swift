//
//  DoneButton.swift
//  Signity
//
//  Created by Andrean Lay on 11/08/21.
//

import SwiftUI

struct DoneButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text("Selesai")
                    .fontWeight(.bold)
                    .font(.system(size: 17))
                    .multilineTextAlignment(.center)
                Spacer()
                
            }
            .padding()
            .foregroundColor(.white)
            .background(Color("MainPurple"))
            .cornerRadius(10)
        }
    }
}

struct DoneButton_Previews: PreviewProvider {
    static var previews: some View {
        DoneButton(action: {})
    }
}
