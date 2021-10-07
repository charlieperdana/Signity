//
//  VideoView.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import SwiftUI

struct VideoView: View {
    @StateObject var viewModel = VideoViewModel()
    
    var videoName: String

    var body: some View {
        VStack(alignment: .trailing) {
            LottieView(name: videoName, playbackSpeed: viewModel.playbackSpeed)
                .frame(width: 150, height: 200)
                .background(Color.white)
                .cornerRadius(13)
            
            PlaybackButton(state: viewModel.playbackState) {
                viewModel.togglePlaybackSpeed()
            }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoName: "1 - Jakarta")
    }
}
