//
//  ProgressBar.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Double
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geo.size.width, height: 10)
                    .foregroundColor(Color("MainPurple"))
                    .cornerRadius(25)
                Rectangle()
                    .frame(width: max(CGFloat(value * Double(geo.size.width)), 0), height: 8)
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    .offset(x: 1, y: 0)
                    .animation(.linear)
            }
        }
        .frame(width: .infinity, height: 10)
        .padding()
        .animation(.easeIn)
    }
}

struct Preview_ProgressBar: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: .constant(0.5))
    }
}