//
//  TutorialView.swift
//  Signity
//
//  Created by Komang Aryadinata on 04/08/21.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        VStack {
            Text("Selamat Pagi")
                .fontWeight(.semibold)
                .font(.system(size:17, design: .rounded))
            LottieView(filename: "lottie1")
                .frame(width:240, height:320)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 105, height: 38)
                    .foregroundColor(Color("SignityPurple"))
                Text("Slow")
                    .fontWeight(.semibold)
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 358, height: 50)
                    .foregroundColor(Color("SignityPurple"))
                Text("Mulai Latihan").bold()
                    .font(.system(size:17, design: .rounded))
                    .foregroundColor(.white)
            }
            Text("Bandingkan kalimat ini dengan BISINDO daerah lain")
                .font(.system(size: 13, design: .rounded))
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("SignityPurple"), lineWidth: 1)
                    .frame(width: 358, height: 50)
                    .font(.system(size:17, design: .rounded))
                    .foregroundColor(.white)
                    
                Text("Bandingkan").bold()
                    .font(.system(size:17, design: .rounded))
                    .foregroundColor(Color("SignityPurple"))
            }
            Spacer()
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
