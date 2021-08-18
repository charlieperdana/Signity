//
//  AudioManager.swift
//  Signity
//
//  Created by Andrean Lay on 18/08/21.
//

import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    
    var player: AVAudioPlayer!
    
    enum soundEffectType: String {
        case successBell = "SuccessBell"
    }
    
    func playSound(for type: soundEffectType) {
        let path = Bundle.main.path(forResource: type.rawValue, ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("Could not play audio")
        }
    }
}
