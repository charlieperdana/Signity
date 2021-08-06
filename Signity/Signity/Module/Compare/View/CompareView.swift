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
                .font(.system(size:17, design: .rounded))
            HStack {
                VStack {
                    LottieView(name: "dolphin", playbackSpeed: 1.0)
                        .frame(width:171, height:320)
                    Text("Jakarta")
                        .fontWeight(.semibold)
                        .font(.system(size:17, design: .rounded))
                        .foregroundColor(.black)
                }
                VStack {
                    LottieView(name: "dolphin", playbackSpeed: 1.0)
                        .frame(width:171, height:320)
                    Text("Denpasar")
                        .fontWeight(.semibold)
                        .font(.system(size:17, design: .rounded))
                        .foregroundColor(.black)
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 105, height: 38)
                    .foregroundColor(Color("SignityPurple"))
                Text("Slow")
                    .fontWeight(.semibold)
                    .font(.system(size:17, design: .rounded))
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
