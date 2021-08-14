//
//  CourseViewModel.swift
//  Signity
//
//  Created by Andrean Lay on 09/08/21.
//

import Combine
import Foundation

class CourseViewModel: ObservableObject {
    @Published var currentRegion: String = ""
    @Published var regionProficiency: Int = 0
    
    private(set) var allModules = [ModuleGroup]()
    @Published var currentModules = [ModuleGroup]()

    private var cancellable = Set<AnyCancellable>()
    
    
    init(moduleGroupsPublisher: AnyPublisher<[ModuleGroup], Never> = ModuleGroupStorage.shared.moduleGroups.eraseToAnyPublisher()) {
        
        UserDefaults.standard
            .publisher(for: \.userProfile)
            .sink { profile in
                self.currentRegion = profile.currentRegion.rawValue
                self.regionProficiency = profile.proficiency[profile.currentRegion]!
                
                self.currentModules = self.allModules.filter {
                    $0.regionName == self.currentRegion
                }
            }
            .store(in: &cancellable)
        
        moduleGroupsPublisher.sink { moduleGroups in
            self.allModules = moduleGroups
            
            self.currentModules = moduleGroups.filter {
                $0.regionName == self.currentRegion
            }
        }
        .store(in: &cancellable)
    }
}
