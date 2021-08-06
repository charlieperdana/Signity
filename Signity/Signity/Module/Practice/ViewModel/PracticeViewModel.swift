//
//  PracticeViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

class PracticeViewModel: ObservableObject {
    @Published var currentSelected: Character
    @Published var detectedHands = [Hand]()
    @Published var playbackState: PlaybackState {
        willSet {
            playbackSpeed = (newValue == .slow ? 0.5 : 1.0)
        }
    }
    @Published var currentVideo: String
    var playbackSpeed: CGFloat
    
    @Published var practiceDone = false
    
    init() {
        self.currentSelected = "B"
        self.currentVideo = "blender"
        self.playbackState = .normal
        self.playbackSpeed = 1.0
    }
}
