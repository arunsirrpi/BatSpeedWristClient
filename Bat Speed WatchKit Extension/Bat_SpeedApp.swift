//
//  Bat_SpeedApp.swift
//  Bat Speed WatchKit Extension
//
//  Created by Arun Sirrpi on 10/4/21.
//

import SwiftUI

@main
struct Bat_SpeedApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
