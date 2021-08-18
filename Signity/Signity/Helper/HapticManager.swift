//
//  HapticManager.swift
//  Signity
//
//  Created by Andrean Lay on 18/08/21.
//

import CoreHaptics

extension HapticManager {
    private func successPattern() throws -> CHHapticPattern {
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)

        return try CHHapticPattern(events: [event], parameters: [])
    }
}

class HapticManager {
    var engine: CHHapticEngine? = nil
    
    init() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else {
            return
        }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch let error {
            print("Unable to initialize engine: \(error)")
        }
    }
    
    func playCorrectHaptic() {
        do {
            let pattern = try successPattern()
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}
