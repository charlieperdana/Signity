//
//  OnboardingViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 09/08/21.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    func initializeCourses() {
        let context = PersistenceController.shared.persistentContainer.viewContext
        
        for region in AvailableCourses.regions {
            for moduleCategory in region.categories {
                let moduleGroup = ModuleGroup(context: context)
                moduleGroup.name = moduleCategory.name
                moduleGroup.regionName = region.name
                moduleGroup.level = Int16(moduleCategory.level)

                for module in moduleCategory.modules {
                    let category = Category(context: context)
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
