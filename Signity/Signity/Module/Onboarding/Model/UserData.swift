//
//  OnboardingData.swift
//  Signity
//
//  Created by charlie siagian on 09/08/21.
//

import Foundation


class UserData {
    static let shared = UserData()
    
    var isBisindoBeginner : Bool {
        get {
            UserDefaults.standard.bool(forKey: "isBeginner")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isBeginner")
        }
    }
    
    var firstLaunched: Bool {
        get {
            UserDefaults.standard.bool(forKey: "firstLaunched")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "firstLaunched")
        }
    }
    
    var region : String {
        get {
            UserDefaults.standard.string(forKey: "regionBisindo")!
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "regionBisindo")
        }
    }
    
    var level: Int {
        get {
            UserDefaults.standard.integer(forKey: "currentLevel")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "currentLevel")
        }
    }
    
    init() {
        self.isBisindoBeginner = UserDefaults.standard.object(forKey: "isBeginner") as? Bool ?? false
        self.region = UserDefaults.standard.object(forKey: "regionBisindo") as? String ?? ""
    }
}
