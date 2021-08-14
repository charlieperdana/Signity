//
//  SignitySubtitle.swift
//  Signity
//
//  Created by Andrean Lay on 12/08/21.
//

import SwiftUI

struct SignitySubtitle: ViewModifier {
    var color: SignityTextColor
    
    func body(content: Content) -> some View {
        content
            .font(.title2.bold())
            .multilineTextAlignment(.center)
            .foregroundColor(Color(color.rawValue))
    }
}
