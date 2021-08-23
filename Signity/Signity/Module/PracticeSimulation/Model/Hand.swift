//
//  Hand.swift
//  Signity
//
//  Created by Andrean Lay on 04/08/21.
//

import CoreGraphics

struct Landmarks {
    var tip: CGPoint = .zero
    var dip: CGPoint = .zero
    var pip: CGPoint = .zero
    var mcp: CGPoint = .zero
}

struct Hand {
    var thumb = Landmarks()
    var index = Landmarks()
    var middle = Landmarks()
    var ring = Landmarks()
    var little = Landmarks()
    var wrist: CGPoint = .zero
}
