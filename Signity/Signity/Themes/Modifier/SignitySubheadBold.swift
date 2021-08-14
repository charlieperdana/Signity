//
//  SignitySubheadBold.swift
//  Signity
//
//  Created by Andrean Lay on 12/08/21.
//

import Foundation

import SwiftUI

struct SignitySubheadBold: ViewModifier {
    var color: SignityTextColor
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline.bold())
            .multilineTextAlignment(.center)
            .foregroundColor(Color(color.rawValue))
    }
}
