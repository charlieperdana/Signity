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
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .foregroundColor(Color(color.rawValue))
    }
}
