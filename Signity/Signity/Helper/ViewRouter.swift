//
//  ViewRouter.swift
//  Signity
//
//  Created by Andrean Lay on 13/08/21.
//

import Foundation

class ViewRouter: ObservableObject {
    enum Page {
        case onboarding
        case course
    }
    
    @Published var currentPage: Page = .onboarding
    
    init() {
        if UserDefaults.standard.didCompleteSetup {
            currentPage = .course
        } else {
            currentPage = .onboarding
        }
    }
}
