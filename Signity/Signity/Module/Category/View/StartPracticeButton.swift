//
//  StartPracticeButton.swift
//  Signity
//
//  Created by Andrean Lay on 10/08/21.
//

import SwiftUI

struct StartPracticeButton: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Mulai Latihan")
                .fontWeight(.bold)
                .font(.system(size: 17))
                .multilineTextAlignment(.center)
            Spacer()
            
        }
        .padding()
        .foregroundColor(.white)
        .background(Color(#colorLiteral(red: 0.2549019608, green: 0.3019607843, blue: 0.8470588235, alpha: 1)))
        .cornerRadius(13)
    }
}

struct StartPracticeButton_Previews: PreviewProvider {
    static var previews: some View {
        StartPracticeButton()
    }
}
