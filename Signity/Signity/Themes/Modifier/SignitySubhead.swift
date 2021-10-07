//
//  SignitySubhead.swift
//  Signity
//
//  Created by Andrean Lay on 12/08/21.
//

import SwiftUI

struct SignitySubhead: ViewModifier {
    var color: SignityTextColor
    
    func body(content: Content) -> some View {
        content
            .font(.system(.subheadline, design: .rounded))
            .multilineTextAlignment(.center)
            .foregroundColor(Color(color.rawValue))
    }
}
