//
//  HandLandmarks.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import Foundation

import SwiftUI

struct HandLandmarks: Shape {
    var hands: [Hand]
    private let path = UIBezierPath()
    
    init(for hands: [Hand]) {
        self.hands = hands
    }
    
    func path(in rect: CGRect) -> Path {
        for hand in self.hands {
            self.drawCircles(for: hand)
        }
        
        return Path(path.cgPath)
    }
    
    private func drawCircles(for hand: Hand) {
        for finger in Mirror(reflecting: hand).children {
            for landmark in Mirror(reflecting: finger.value).children {
                if let point = landmark.value as? CGPoint {
                    path.move(to: point)
                    path.addArc(withCenter: point, radius: 3, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
                }
            }
        }
    }
}
