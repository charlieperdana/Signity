//
//  CourseStorage.swift
//  Signity
//
//  Created by Andrean Lay on 09/08/21.
//

import Combine
import CoreData

class ModuleGroupRepository {
    let context = PersistenceController.shared.persistentContainer.viewContext
    
    func fetch() -> [ModuleGroup] {
        let fetchRequest: NSFetchRequest<ModuleGroup> = ModuleGroup.fetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "ordering", ascending: true)
        ]
        
        if let modules = try? context.fetch(fetchRequest) {
            return modules
        }
        
        return []
    }
}
