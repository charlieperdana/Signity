//
//  SimulationViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import CoreML

class SimulationViewModel: ObservableObject {
    var handLandmarks = [[Double]]()
    @Published var detectedHands = [Hand]()
    
    @Published var simulationDone = false
    
    var category: Category
    var courses: [Course]
    
    @Published var speakerCurrentWord: String
    @Published var userCurrentWord: String
    var userPosition: Int
    var userTurnDone = 0
    
    @Published var wordTracking: [String]
    @Published var correctWord = 0
    
    let predictor = CoreMLHelper()
    
    var tempDone = false
    
    @Published var navBarHidden = false
    
    init(category: Category) {
        self.category = category
        
        courses = category.courses
        
        userPosition = 1
        userCurrentWord = courses[userPosition].name
        wordTracking = courses[userPosition].wordParts
        
        speakerCurrentWord = courses[userPosition - 1].name
    }
    
    func addToActionsList(landmark: [Double]) {
        if tempDone {
            return
        }
        
        handLandmarks.append(landmark)
        
        if handLandmarks.count >= 60 {
            self.predictSign()
        }
    }
    
    private func predictSign() {
        do {
            let landmarks = try MLMultiArray(shape: [1, 60, 126], dataType: .double)
            for (row, arr) in self.handLandmarks.enumerated() {
                for (col, data) in arr.enumerated() {
                    landmarks[[0 as NSNumber, row as NSNumber, col as NSNumber]] = NSNumber(floatLiteral: data)
                }
            }
            
            let predictedSign = predictor.predict(multiArray: landmarks)
            self.evaluatePrediction(for: predictedSign)
        } catch {
            
        }
        
        handLandmarks.removeFirst(30)
    }
    
    private func evaluatePrediction(for label: String) {
        DispatchQueue.main.async { [self] in
            // Check if predicted label is correct
            if label == wordTracking[correctWord] || wordTracking[correctWord] == "Selamat siang" {
                correctWord += 1
                self.sendCorrectFeedback()
            }
        
            // Check if current sentence is done
            if correctWord == wordTracking.count {
                if userPosition + 2 >= courses.count {
                    navBarHidden = false
                    tempDone = true
                } else {
                    userPosition += 2
                    correctWord = 0
                    
                    userCurrentWord = courses[userPosition].name
                    speakerCurrentWord = courses[userPosition - 1].name
                    wordTracking = courses[userPosition].wordParts
                }
                
                userTurnDone += 1
            }
        }
    }
    
    private func sendCorrectFeedback(hapticManager: HapticManager = HapticManager()) {
        hapticManager.playCorrectHaptic()
        AudioManager.shared.playSound(for: .successBell)
    }
}
