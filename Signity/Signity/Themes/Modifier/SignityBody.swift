//
//  SignityBody.swift
//  Signity
//
//  Created by Andrean Lay on 12/08/21.
//

import SwiftUI

struct SignityBody: ViewModifier {
    var color: SignityTextColor
    
    func body(content: Content) -> some View {
        content
            .font(.system(.body, design: .rounded))
            .multilineTextAlignment(.center)
            .foregroundColor(Color(color.rawValue))
    }
}
