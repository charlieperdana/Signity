//
//  SignityApp.swift
//  Signity
//
//  Created by charlie siagian on 02/08/21.
//

import SwiftUI

@main
struct SignityApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                PersistenceController.shared.saveContext()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        DataMigrator.checkIfMigrationNeeded()
        
        return true
    }
}
