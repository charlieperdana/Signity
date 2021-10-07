//
//  SettingViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 09/08/21.
//

import Foundation

class SettingViewModel: ObservableObject {
    private(set) var daerah = ["Jakarta", "Denpasar"]
    
    var currentRegion: String {
        set {
            let profile = UserDefaults.standard.userProfile
            profile.currentRegion = RegionType(rawValue: newValue)!
            UserDefaults.standard.userProfile = profile
            
            objectWillChange.send()
        }
        get {
            UserDefaults.standard.userProfile.currentRegion.rawValue
        }
    }
    
    init() {
        currentRegion =  UserDefaults.standard.userProfile.currentRegion.rawValue
    }
}
