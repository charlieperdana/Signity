//
//  CourseViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 09/08/21.
//

import Combine

class CourseViewModel: ObservableObject {
    @Published var currentRegion: String
    
    private var moduleGroupStorage = ModuleGroupStorage()
    private var cancellable: AnyCancellable?
    
    @Published var moduleGroups = [ModuleGroup]()
    
    init(moduleGroupsPublisher: AnyPublisher<[ModuleGroup], Never> = ModuleGroupStorage.shared.moduleGroups.eraseToAnyPublisher()) {
        currentRegion = UserData.shared.region
        
        cancellable = moduleGroupsPublisher.sink { moduleGroups in
            self.moduleGroups = moduleGroups
        }
    }
}
