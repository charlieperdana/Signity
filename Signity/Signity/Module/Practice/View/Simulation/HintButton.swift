//
//  HintButton.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI

struct HintButton: View {
    var body: some View {
        Button(action: {}, label: {
            Text("Lupa?")
                .font(.headline)
        })
        .frame(width: 80, height: 40)
        .background(Color("MainPurple"))
        .foregroundColor(.white)
        .cornerRadius(15)
    }
}

struct HintButton_Previews: PreviewProvider {
    static var previews: some View {
        HintButton()
    }
}
