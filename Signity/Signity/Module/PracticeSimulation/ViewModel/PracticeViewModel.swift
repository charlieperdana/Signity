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
        }
    }
    @Published var currentIndex = 0
    let predictor = CoreMLHelper()
    
    init(category: Category, chosenCourse: Course) {
        self.category = category
        self.chosenCourse = chosenCourse
        
        currentIndex = getCourseIndex(for: chosenCourse)
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

                if predictedSign == chosenCourse.name {
                    self.sendCorrectFeedback()
                    
                    for i in category.courses.indices {
                        if category.courses[i] == chosenCourse {
                            category.courses[i].completionState = 1
                            PersistenceController.shared.saveContext()
                            
                            self.moveToNextQuestion()
                            break
                        }
                    }
                    
                }
            } catch {
                // handle errors
            }
            
            handLandmarks.removeFirst(5)
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
