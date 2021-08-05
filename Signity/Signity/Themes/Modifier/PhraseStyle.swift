//
//  PhraseStyle.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct PhraseStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.bold())
            .foregroundColor(Color("DarkPurple"))
            .multilineTextAlignment(.center)
    }
}
