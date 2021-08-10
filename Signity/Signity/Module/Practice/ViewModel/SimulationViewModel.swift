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
    
    @Published var wordTracking = [
        "Selamat Siang"
    ]
    @Published var correctWord = 0
    
    let predictor = CoreMLHelper()
    
    var tempDone = false
    
    @Published var navBarHidden = false
    
    init(category: Category) {
        self.category = category
        
        courses = category.courses?.array as! [Course]
        
        speakerCurrentWord = courses[0].name!
        userCurrentWord = courses[1].name!
    }
    
    func addToActionsList(landmark: [Double]) {
        if tempDone {
            return
        }
        
        handLandmarks.append(landmark)
        
        if handLandmarks.count == 60 {
            do {
                let landmarks = try MLMultiArray(shape: [1, 60, 126], dataType: .double)
                for (row, arr) in self.handLandmarks.enumerated() {
                    for (col, data) in arr.enumerated() {
                        landmarks[[0 as NSNumber, row as NSNumber, col as NSNumber]] = NSNumber(floatLiteral: data)
                    }
                }
                
                let predictedSign = predictor.predictAction(multiArray: landmarks)
                print("Predicted: \(predictedSign)")
                
                if predictedSign == wordTracking[correctWord] {
                    correctWord += 1

                    if correctWord == wordTracking.count {
                        if userCurrentWord == courses[3].name! {
                            tempDone = true
                            navBarHidden = false
                            return
                        }

                        DispatchQueue.main.async { [self] in
                            speakerCurrentWord = courses[2].name!
                            userCurrentWord = courses[3].name!
                            wordTracking = [
                                "Aku",
                                "Sakit"
                            ]
                            
                            correctWord = 0
                        }
                    }
                }
            } catch {
                
            }
            
            handLandmarks.removeAll()
        }
    }
}
