//
//  SignityHeadlineThin.swift
//  Signity
//
//  Created by Andrean Lay on 12/08/21.
//

import SwiftUI

struct SignityHeadlineThin: ViewModifier {
    var color: SignityTextColor
    
    func body(content: Content) -> some View {
        content
            .font(.system(.headline, design: .rounded).weight(.semibold))
            .multilineTextAlignment(.center)
            .foregroundColor(Color(color.rawValue))
    }
}
