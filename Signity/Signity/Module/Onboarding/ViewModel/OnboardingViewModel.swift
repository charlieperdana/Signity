//
//  OnboardingViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 09/08/21.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    private(set) var availableRegion = ["Jakarta", "Denpasar", "Lainnya"]
    @Published var selectedRegion = ""
    
    func completeOnboardingSetup(newPractitioner: Bool = false) {
        let region = RegionType(rawValue: selectedRegion)
        let selectedRegion = region ?? .jakarta
        
        var proficiency = [RegionType: Int]()
        for region in availableRegion {
            if let regionType = RegionType(rawValue: region) {
                if newPractitioner {
                    proficiency[regionType] = 0
                } else {
                    proficiency[regionType] = (selectedRegion == regionType ? 100 : 0)
                }
            }
        }
        
        let profile = UserProfile(
            currentRegion: selectedRegion,
            proficiency: proficiency
        )
        
        DataMigrator.checkIfMigrationNeeded()
        
        UserDefaults.standard.userProfile = profile
        UserDefaults.standard.didCompleteSetup = true
    }
}
