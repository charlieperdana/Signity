//
//  SignityHeadline.swift
//  Signity
//
//  Created by Andrean Lay on 12/08/21.
//

import SwiftUI

struct SignityHeadline: ViewModifier {
    var color: SignityTextColor
    
    func body(content: Content) -> some View {
        content
            .font(.headline.bold())
            .multilineTextAlignment(.center)
            .foregroundColor(Color(color.rawValue))
    }
}
