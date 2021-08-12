//
//  SignityFootnoteBold.swift
//  Signity
//
//  Created by Andrean Lay on 12/08/21.
//

import SwiftUI

struct SignityFootnoteBold: ViewModifier {
    var color: SignityTextColor
    
    func body(content: Content) -> some View {
        content
            .font(.footnote.bold())
            .multilineTextAlignment(.center)
            .foregroundColor(Color(color.rawValue))
    }
}
