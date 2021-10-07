//
//  VideoViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 22/08/21.
//

import SwiftUI

class VideoViewModel: ObservableObject {
    var playbackState: PlaybackState = .normal
    @Published var playbackSpeed: CGFloat = 1.0
    
    func togglePlaybackSpeed() {
        if self.playbackState == .normal {
            self.playbackState = .slow
            self.playbackSpeed = 0.5
        } else {
            self.playbackState = .normal
            self.playbackSpeed = 1.0
        }
    }
}
