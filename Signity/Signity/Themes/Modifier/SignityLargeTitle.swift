//
//  SignityLargeTitle.swift
//  Signity
//
//  Created by Andrean Lay on 12/08/21.
//

import SwiftUI

struct SignityLargeTitle: ViewModifier {
    var color: SignityTextColor
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .multilineTextAlignment(.center)
            .foregroundColor(Color(color.rawValue))
    }
}
