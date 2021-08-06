//
//  TutorialViewModel.swift
//  Signity
//
//  Created by Komang Aryadinata on 06/08/21.
//

import SwiftUI

class TutorialViewModel: ObservableObject {
    @Published var playbackState: PlaybackState {
        willSet {
            playbackSpeed = (newValue == .slow ? 0.5 : 1.0)
        }
    }
    var playbackSpeed: CGFloat
    
    init() {
        self.playbackState = .normal
        self.playbackSpeed = 1.0
    }
}
