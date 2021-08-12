//
//  OnboardingPreferences.swift
//  Signity
//
//  Created by Andrean Lay on 10/08/21.
//

import Foundation

struct OnboardingPreferences {
    static let shared = OnboardingPreferences()
    
    var didComplete: Bool {
        get {
            UserDefaults.standard.bool(forKey: Constants.ONBOARDING_COMPLETE_KEY)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: Constants.ONBOARDING_COMPLETE_KEY)
        }
    }
}
