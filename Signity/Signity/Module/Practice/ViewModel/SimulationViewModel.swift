//
//  SimulationViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 05/08/21.
//

import Foundation

class SimulationViewModel: ObservableObject {
    @Published var detectedHands = [Hand]()
    
    @Published var simulationDone = false
}
