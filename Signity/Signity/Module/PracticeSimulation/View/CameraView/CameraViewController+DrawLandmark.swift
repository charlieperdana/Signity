//
//  CameraViewController+DrawLandmark.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import UIKit
import Vision

extension CameraViewController {
    private func processPoint(point: VNRecognizedPoint) -> CGPoint {
        let viewPoint = CGPoint(x: point.location.x, y: 1 - point.location.y)
        let convertedPoint = self.previewLayer.layerPointConverted(fromCaptureDevicePoint: viewPoint)
        
        return convertedPoint
    }
    
    func createHandModel(from observation: VNHumanHandPoseObservation) -> (createdModel: Hand, highConfidenceLandmarks: Int) {
        var hand = Hand()
        var highConfidenceLandmarks = 0
        
        do {
            let points = try observation.recognizedPoints(.all)
    
            for child in Mirror(reflecting: points).children {

                if let joint = child.value as? (key: VNHumanHandPoseObservation.JointName, value: VNRecognizedPoint) {
                    if joint.value.confidence >= 0.85 {
                        highConfidenceLandmarks += 1
                    }
                }
            }
            
            hand.thumb.tip = self.processPoint(for: points[.thumbTip]!)
            hand.thumb.dip = self.processPoint(for: points[.thumbIP]!)
            hand.thumb.pip = self.processPoint(for: points[.thumbMP]!)
            hand.thumb.mcp = self.processPoint(for: points[.thumbCMC]!)
            
            hand.index.tip = self.processPoint(for: points[.indexTip]!)
            hand.index.dip = self.processPoint(for: points[.indexDIP]!)
            hand.index.pip = self.processPoint(for: points[.indexPIP]!)
            hand.index.mcp = self.processPoint(for: points[.indexMCP]!)
            
            hand.middle.tip = self.processPoint(for: points[.middleTip]!)
            hand.middle.dip = self.processPoint(for: points[.middleDIP]!)
            hand.middle.pip = self.processPoint(for: points[.middlePIP]!)
            hand.middle.mcp = self.processPoint(for: points[.middleMCP]!)
            
            hand.ring.tip = self.processPoint(for: points[.ringTip]!)
            hand.ring.dip = self.processPoint(for: points[.ringDIP]!)
            hand.ring.pip = self.processPoint(for: points[.ringPIP]!)
            hand.ring.mcp = self.processPoint(for: points[.ringMCP]!)
            
            hand.little.tip = self.processPoint(for: points[.littleTip]!)
            hand.little.dip = self.processPoint(for: points[.littleDIP]!)
            hand.little.pip = self.processPoint(for: points[.littlePIP]!)
            hand.little.mcp = self.processPoint(for: points[.littleMCP]!)
            
            hand.wrist = self.processPoint(for: points[.wrist]!)
        } catch {
            
        }
        
        return (hand, highConfidenceLandmarks)
    }
}
