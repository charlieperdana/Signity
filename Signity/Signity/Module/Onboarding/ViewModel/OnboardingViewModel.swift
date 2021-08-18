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
        
        self.initializeCourses()
        
        UserDefaults.standard.userProfile = profile
        UserDefaults.standard.didCompleteSetup = true
    }
    
    private func initializeCourses() {
        let context = PersistenceController.shared.persistentContainer.viewContext
        
        for region in AvailableCourses.regions {
            for (index, moduleCategory) in region.categories.enumerated() {
                let moduleGroup = ModuleGroup(context: context)
                moduleGroup.ordering = Int16(index)
                moduleGroup.name = moduleCategory.name
                moduleGroup.regionName = region.name

                var categories = [Category]()
                for module in moduleCategory.modules {
                    let category = Category(context: context)
                    category.code = module.code
                    category.name = module.title
                    category.type = module.type
                    category.level = module.level
                    
                    var courses = [Course]()
                    for submodule in module.submodules {
                        let course = Course(context: context)
                        course.name = submodule.name
                        course.wordParts = submodule.wordParts ?? []
                        course.completionState = 0

                        courses.append(course)
                    }
                    
                    category.courses = courses
                    
                    categories.append(category)
                }
                
                moduleGroup.categories = categories
            }
        }
        
        PersistenceController.shared.saveContext()
    }
}
