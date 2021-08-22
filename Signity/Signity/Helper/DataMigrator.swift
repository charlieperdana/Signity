//
//  DataMigrator.swift
//  Signity
//
//  Created by Andrean Lay on 22/08/21.
//

import Foundation

class DataMigrator {
    static let latestVersion = 1
    
    static func checkIfMigrationNeeded() {
        let currentVersion = UserDefaults.standard.currentDatabaseVersion
        if currentVersion < latestVersion {
            migrateData(from: currentVersion, to: latestVersion)
        }
    }
    
    private static func migrateData(from oldVersion: Int, to newVersion: Int) {
        switch oldVersion {
            case 0:
                SignityData.VersionOne()
                fallthrough
            default:
                UserDefaults.standard.currentDatabaseVersion = latestVersion
        }
    }
}

class SignityData {
    static func VersionOne() {
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
    static func VersionTwo() {

    }
}
