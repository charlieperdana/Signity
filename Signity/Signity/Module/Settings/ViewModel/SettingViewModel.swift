//
//  SettingViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 09/08/21.
//

import Foundation

class SettingViewModel: ObservableObject {
    var daerah = ["Jakarta", "Denpasar"]
    
    var currentRegion: String {
        set {
            UserData.shared.region = newValue
            objectWillChange.send()
        }
        get {
            UserData.shared.region
        }
    }
    
    init() {
        currentRegion = UserData.shared.region
    }
}
