//
//  ChatBubble.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI

struct ChatTriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let path = Path { p in
            p.move(to: CGPoint(x: 10, y: 0))
            p.addLine(to: CGPoint(x: width - 20, y: 0))
            p.addQuadCurve(
                to: CGPoint(x: width - 10, y: 20),
                control: CGPoint(x: width - 9, y: 0))
            p.addLine(to: CGPoint(x: width - 10, y: height - 15))
            p.addLine(to: CGPoint(x: width, y: height))
            
            // Draw bottom left corner
            p.addLine(to: CGPoint(x: 10, y: height))
            p.addQuadCurve(
                to: CGPoint(x: 0, y: height - 10),
                control: CGPoint(x: 0, y: height))
            
            // Draw top left corner
            p.addLine(to: CGPoint(x: 0, y: 10))
            p.addQuadCurve(
                to: CGPoint(x: 10, y: 0),
                control: CGPoint(x: 0, y: 0))
        }
        
        return path
    }
}
