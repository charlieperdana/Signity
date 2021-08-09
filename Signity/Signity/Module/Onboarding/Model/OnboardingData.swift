//
//  OnboardingData.swift
//  Signity
//
//  Created by charlie siagian on 09/08/21.
//

import Foundation


class OnboardingData: ObservableObject {
    @Published var isBisindoBeginner : Bool {
        didSet{
            UserDefaults.standard.set(isBisindoBeginner, forKey: "isBeginner")
        }
        
    }
    
    @Published var region : String {
        didSet{
            UserDefaults.standard.set(region, forKey: "regionBisindo")
        }
        
    }
    
    init() {
        self.isBisindoBeginner = UserDefaults.standard.object(forKey: "isBeginner") as? Bool ?? false
        self.region = UserDefaults.standard.object(forKey: "regionBisindo") as? String ?? ""
    }
}
