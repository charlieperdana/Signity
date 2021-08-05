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
    var playbackSpeed: CGFloat
    
    init() {
        self.currentSelected = "B"
        self.playbackState = .normal
        self.playbackSpeed = 1.0
    }
}