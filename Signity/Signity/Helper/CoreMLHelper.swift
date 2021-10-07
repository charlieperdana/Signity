//
//  CoreMLHelper.swift
//  Signity
//
//  Created by Andrean Lay on 10/08/21.
//

import CoreML

class CoreMLHelper {
    func predict(multiArray: MLMultiArray) -> String {
        do {
            let model = try SignityVisionJKT()
            let prediction = try model.prediction(Landmarks: multiArray)
            
            return prediction.classLabel
        } catch {
            fatalError("Fail to predict")
        }
    }
}
