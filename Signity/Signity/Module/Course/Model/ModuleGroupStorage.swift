//
//  CourseStorage.swift
//  Signity
//
//  Created by Andrean Lay on 09/08/21.
//

import Combine
import CoreData

class ModuleGroupStorage: NSObject, ObservableObject {
    var moduleGroups = CurrentValueSubject<[ModuleGroup], Never>([])
    private let moduleGroupsFetchController: NSFetchedResultsController<ModuleGroup>

    static let shared = ModuleGroupStorage()
    
    override init() {
        let fetchRequest: NSFetchRequest<ModuleGroup> = ModuleGroup.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "regionName == %@", UserData.shared.region)
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "level", ascending: true)
        ]
        
        moduleGroupsFetchController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: PersistenceController.shared.persistentContainer.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        super.init()
        
        moduleGroupsFetchController.delegate = self
        
        do {
            try moduleGroupsFetchController.performFetch()
            moduleGroups.value = moduleGroupsFetchController.fetchedObjects ?? []
        } catch {
            print("Could not fetch object")
        }
    }
}

extension ModuleGroupStorage: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let moduleGroups = controller.fetchedObjects as? [ModuleGroup] else {
            return
        }
        
        self.moduleGroups.value = moduleGroups
    }
}
