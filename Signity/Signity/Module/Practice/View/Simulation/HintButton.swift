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
                .modifier(SignityHeadlineThin(color: .white))
        })
        .frame(width: 80, height: 40)
        .background(Color("Button"))
        .cornerRadius(15)
    }
}

struct HintButton_Previews: PreviewProvider {
    static var previews: some View {
        HintButton()
    }
}
