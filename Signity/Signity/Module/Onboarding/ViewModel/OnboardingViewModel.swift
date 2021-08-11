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
    
    func completeOnboardingSetup() {
        let region = RegionType(rawValue: selectedRegion)
        let selectedRegion = region ?? .jakarta
        
        var proficiency = [RegionType: Int]()
        for region in availableRegion {
            if let regionType = RegionType(rawValue: region) {
                proficiency[regionType] = (selectedRegion == regionType ? 100 : 0)
            }
        }
        
        let profile = UserProfile(
            currentRegion: selectedRegion,
            proficiency: proficiency
        )
        
        self.initializeCourses()
        
        UserDefaults.standard.userProfile = profile
        UserDefaults.standard.didCompleteSetup = true
    }
    
    private func initializeCourses() {
        let context = PersistenceController.shared.persistentContainer.viewContext
        
        for region in AvailableCourses.regions {
            for moduleCategory in region.categories {
                let moduleGroup = ModuleGroup(context: context)
                moduleGroup.name = moduleCategory.name
                moduleGroup.regionName = region.name
                moduleGroup.level = Int16(moduleCategory.level)

                for module in moduleCategory.modules {
                    let category = Category(context: context)
                    category.code = module.code
                    category.name = module.title
                    category.type = module.type
                    
                    for submodules in module.submodules {
                        let course = Course(context: context)
                        course.name = submodules.name
                        course.completionState = 0
                        
                        category.addToCourses(course)
                    }
                    
                    moduleGroup.addToCategories(category)
                }
            }
        }
        
        PersistenceController.shared.saveContext()
    }
}
