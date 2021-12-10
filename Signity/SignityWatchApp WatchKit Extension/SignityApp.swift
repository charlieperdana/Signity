//
//  SignityApp.swift
//  SignityWatchApp WatchKit Extension
//
//  Created by Andrean Lay on 29/10/21.
//

import SwiftUI

@main
struct SignityApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
