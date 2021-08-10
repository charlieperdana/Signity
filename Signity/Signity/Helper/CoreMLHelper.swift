//
//  CoreMLHelper.swift
//  Signity
//
//  Created by Andrean Lay on 10/08/21.
//

import CoreML

class CoreMLHelper {
    var jakartaSign: SignityVisionJKT
    var jakartaMotionSign: SignityVisionMotionJKT
    
    init() {
        jakartaSign = try! SignityVisionJKT(configuration: MLModelConfiguration())
        jakartaMotionSign = try! SignityVisionMotionJKT(configuration: MLModelConfiguration())
    }
    
    func predict(multiArray: MLMultiArray) -> String {
        do {
            let prediction = try jakartaSign.prediction(Landmarks: multiArray)
            
            return prediction.classLabel
        } catch {
            
        }
        
        return ""
    }
    
    func predictAction(multiArray: MLMultiArray) -> String {
        do {
            let prediction = try jakartaMotionSign.prediction(Landmarks: multiArray)
            
            return prediction.classLabel
        } catch {
            
        }
        
        return ""
    }
}
