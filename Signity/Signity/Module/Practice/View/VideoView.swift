//
//  VideoView.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI

struct VideoView: View {
    var videoName: String
    @Binding var playbackSpeed: CGFloat
    @Binding var playbackState: PlaybackState
    
    var body: some View {
        VStack(alignment: .trailing) {
            LottieView(name: videoName, playbackSpeed: playbackSpeed)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                .background(Color.white)
                .cornerRadius(13)
            
            PlaybackButton(state: playbackState) {
                if playbackState == .slow {
                    playbackState = .normal
                } else {
                    playbackState = .slow
                }
            }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoName: "1 - Jakarta", playbackSpeed: .constant(0.5), playbackState: .constant(.normal))
    }
}
