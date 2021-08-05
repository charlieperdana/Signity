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
                .font(.headline)
            LottieView(filename: "IMG_1219.mov.lottie")
                .frame(width:240, height:320)
            
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 105, height: 38)
                    .foregroundColor(Color("SignityPurple"))
                Text("Slow")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 358, height: 50)
                    .foregroundColor(Color("SignityPurple"))
                Text("Mulai Latihan").bold()
                    .foregroundColor(.white)
            }
            Text("Bandingkan kalimat ini dengan BISINDO daerah lain")
                .font(.system(size: 13))
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("SignityPurple"), lineWidth: 1)
                    .frame(width: 358, height: 50)
                    .foregroundColor(.white)
                    
                Text("Bandingkan").bold()
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
