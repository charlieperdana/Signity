//
//  OnboardingData.swift
//  Signity
//
//  Created by charlie siagian on 09/08/21.
//

import Foundation

enum RegionType: String, Codable {
    case jakarta = "Jakarta"
    case denpasar = "Denpasar"
}

class UserProfile: NSObject, Codable {
    var currentRegion: RegionType
    var proficiency: [RegionType: Int]
    
    init(currentRegion: RegionType, proficiency: [RegionType: Int]) {
        self.currentRegion = currentRegion
        self.proficiency = proficiency
    }
}

extension UserDefaults {
    private enum Keys {
        static let onboardingDidCompleteKey = "OnboardingDidComplete"
        static let userProfileKey = "UserProfile"
        static let databaseVersionKey = "DatabaseVersion"
    }
    
    @objc var userProfile: UserProfile {
        get {
            let fetchedProfile = object(forKey: Keys.userProfileKey) as! Data
            let profile = try! JSONDecoder().decode(UserProfile.self, from: fetchedProfile)
            
            return profile
        }
        set {
            let encodedProfile = try! JSONEncoder().encode(newValue)
            setValue(encodedProfile, forKey: Keys.userProfileKey)
        }
    }
    
    @objc var didCompleteSetup: Bool {
        get {
            bool(forKey: Keys.onboardingDidCompleteKey)
        }
        set {
            set(newValue, forKey: Keys.onboardingDidCompleteKey)
        }
    }
    
    @objc var currentDatabaseVersion: Int {
        get {
            integer(forKey: Keys.databaseVersionKey)
        }
        set {
            setValue(newValue, forKey: Keys.databaseVersionKey)
        }
    }
}
