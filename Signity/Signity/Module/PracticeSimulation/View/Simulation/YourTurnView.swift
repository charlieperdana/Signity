//
//  YourTurnView.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI

struct YourTurnView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .opacity(0.9)
                .cornerRadius(15)
            Text("Giliranmu")
                .modifier(SignityHeadlineThin(color: .darkPurple))
        }
        .frame(width: 100, height: 40)
    }
}

struct YourTurnView_Previews: PreviewProvider {
    static var previews: some View {
        YourTurnView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
