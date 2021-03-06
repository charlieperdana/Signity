//
//  BackButton.swift
//  Signity
//
//  Created by Andrean Lay on 10/08/21.
//

import SwiftUI

struct BackButton: View {
    var color: Color = Color("Button")
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .frame(width: 12, height: 20)
                    .foregroundColor(color)
                Spacer()
            }
            .contentShape(Rectangle())
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(action: {})
    }
}
