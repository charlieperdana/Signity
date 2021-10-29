//
//  PracticeViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 03/08/21.
//

import SwiftUI
import CoreML

class PracticeVideoQueue {
    static let shared = PracticeVideoQueue()
    var videoName: String = ""
    
    private init() {
        
    }
}

class PracticeViewModel: ObservableObject {
    var handLandmarks = [[Double]]()
    @Published var detectedHands = [Hand]()
    
    @Published var practiceDone = false
    
    @Published var category: Category
    @Published var chosenCourse: Course {
        willSet {
            currentIndex = getCourseIndex(for: newValue)
            
            if category.typeEnum == .situation {
                self.wordTracking = category.courses[currentIndex].wordParts
            }
        }
    }
    @Published var currentIndex = 0
    let predictor = CoreMLHelper()
    
    // Situation type variables
    @Published var wordTracking: [String] = []
    @Published var correctWord: [Int] = []
    
    init(category: Category, chosenCourse: Course) {
        self.category = category
        self.chosenCourse = chosenCourse
        
        currentIndex = getCourseIndex(for: chosenCourse)
        
        if category.typeEnum == .situation {
            wordTracking = chosenCourse.wordParts
            correctWord = Array(repeating: 0, count: category.courses.count)
        }
    }

    func addLandmarks(landmark: [Double]) {
        handLandmarks.append(landmark)
        
        if handLandmarks.count >= 60 {
            do {
                let landmarks = try MLMultiArray(shape: [1, 60, 126], dataType: .double)
                for (row, arr) in self.handLandmarks.enumerated() {
                    for (col, data) in arr.enumerated() {
                        landmarks[[0 as NSNumber, row as NSNumber, col as NSNumber]] = NSNumber(floatLiteral: data)
                    }
                }
                
                let predictedSign = predictor.predict(multiArray: landmarks)
                if category.typeEnum == .situation {
                    self.evaluateSituationPrediction(for: predictedSign)
                } else {
                    self.evaluatePrediction(for: predictedSign)
                }
            } catch {
                // handle errors
            }
            
            handLandmarks.removeFirst()
        }
    }
    
    private func evaluatePrediction(for label: String) {
        if label == chosenCourse.name {
            self.sendCorrectFeedback()

            category.courses[currentIndex].completionState = 1
            PersistenceController.shared.saveContext()
            
            self.moveToNextQuestion()
        }
    }

    private func evaluateSituationPrediction(for label: String) {
        if correctWord[currentIndex] >= wordTracking.count {
            return
        }
        
        DispatchQueue.main.async { [self] in
            if label == wordTracking[correctWord[currentIndex]] {
                
                correctWord[currentIndex] += 1
                self.sendCorrectFeedback()
            }
            
            if correctWord[currentIndex] == wordTracking.count {
                category.courses[currentIndex].completionState = 1
                PersistenceController.shared.saveContext()
                
                self.moveToNextQuestion()
            }
        }
    }
    
    private func moveToNextQuestion() {
        for i in (currentIndex + 1)..<category.courses.count {
            if category.courses[i].completionState == 0 {
                DispatchQueue.main.async { [self] in
                    currentIndex = i
                    chosenCourse = category.courses[i]
                }
                
                break
            }
        }
    }
    
    private func getCourseIndex(for course: Course) -> Int {
        for i in category.courses.indices {
            if category.courses[i] == course {
                return i
            }
        }
        
        return 0
    }
    
    private func sendCorrectFeedback(hapticManager: HapticManager = HapticManager()) {
        hapticManager.playCorrectHaptic()
        AudioManager.shared.playSound(for: .successBell)
    }
}
