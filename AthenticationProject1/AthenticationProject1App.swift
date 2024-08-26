//
//  AthenticationProject1App.swift
//  AthenticationProject1
//
//  Created by Peyman Osatian on 2024-08-25.
//

import SwiftUI
import Firebase

@main
struct AthenticationProject1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
   
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                AuthenticationView()
            }
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
      
        return true
    }
}
