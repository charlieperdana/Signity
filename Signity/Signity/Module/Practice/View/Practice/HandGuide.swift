//
//  HandGuide.swift
//  Signity
//
//  Created by Andrean Lay on 06/08/21.
//

import SwiftUI

struct HandGuide: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .opacity(0.5)
            VStack {
                Image("VerticalPhoneGuide")
                Text("Letakan ponsel secara vertikal")
                Image("HandGuide")
                    .padding(.top, 125)
            }
        }
    }
}

struct HandGuide_Previews: PreviewProvider {
    static var previews: some View {
        HandGuide()
    }
}
