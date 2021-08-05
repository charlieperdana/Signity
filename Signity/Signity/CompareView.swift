//
//  CompareView.swift
//  Signity
//
//  Created by Komang Aryadinata on 05/08/21.
//

import SwiftUI

struct CompareView: View {
    var body: some View {
        VStack {
            Text("Aku sehat, bagaimana denganmu?")
                .fontWeight(.semibold)
                .font(.headline)
            Spacer()
            HStack {
                //lottie video view
                //lottie video view
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 105, height: 38)
                    .foregroundColor(Color("SignityPurple"))
                Text("Slow")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            Spacer()
        }
    }
}

struct CompareView_Previews: PreviewProvider {
    static var previews: some View {
        CompareView()
    }
}
