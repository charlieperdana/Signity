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
    @Published var playbackState: PlaybackState {
        willSet {
            playbackSpeed = (newValue == .slow ? 0.5 : 1.0)
        }
    }
    var playbackSpeed: CGFloat
    
    @Published var practiceDone = false
    
    @Published var category: Category
    @Published var chosenCourse: Course
    let predictor = CoreMLHelper()
    
    init(category: Category, chosenCourse: Course) {
        self.category = category
        self.chosenCourse = chosenCourse

        self.playbackState = .normal
        self.playbackSpeed = 1.0
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
                    for course in category.courses {
                        if course.name == chosenCourse.name {
                            course.completionState = 1
                            PersistenceController.shared.saveContext()
                        }
                    }
                    
                }
            } catch {
                
            }
            
            handLandmarks.removeFirst(30)
        }
    }
    
    private func sendCorrectFeedback(hapticManager: HapticManager = HapticManager()) {
        hapticManager.playCorrectHaptic()
        AudioManager.shared.playSound(for: .successBell)
    }
}
