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
                .background(Color.white)
                .opacity(0.6)
                .cornerRadius(15)
            Text("Giliranmu")
                .font(.headline)
                .foregroundColor(Color("DarkPurple"))
        }
        .frame(width: 100, height: 40)
    }
}

struct YourTurnView_Previews: PreviewProvider {
    static var previews: some View {
        YourTurnView()
    }
}
