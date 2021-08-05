//
//  FingerLandmarks.swift
//  Signity
//
//  Created by Andrean Lay on 04/08/21.
//

import SwiftUI

struct HandLines: Shape {
    var hands: [Hand]

    init(for hands: [Hand]) {
        self.hands = hands
    }
    
    func path(in rect: CGRect) -> Path {
        let path = Path { p in
            
            // Loop through every detected hands
            for hand in self.hands {

                // Loop through every fingers in current hand
                for finger in Mirror(reflecting: hand).children {
                    
                    // Loop through every landmarks in current finger
                    for landmark in Mirror(reflecting: finger.value).children where finger.label != "wrist" {
                        if let point = landmark.value as? CGPoint {
                            
                            // Draw lines from finger tip to wrist
                            if landmark.label == "tip" {
                                p.move(to: point)
                            } else {
                                p.addLine(to: point)
                            }
                        }
                    }
                    
                    p.addLine(to: hand.wrist)
                }
            }
        }
        
        return path
    }
}
