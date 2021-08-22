//
//  TimeoutManager.swift
//  Signity
//
//  Created by Andrean Lay on 22/08/21.
//

import UIKit

class TimeoutManager {
    static let shared = TimeoutManager()
    
    func enableDimming() {
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    func disableDimming() {
        UIApplication.shared.isIdleTimerDisabled = true
    }
}
