//  PelicxsApp.swift
//  Pelicxs
//
//  Created by Diego Trejo on 14/03/25.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct PelicxsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        
        let login = FirebaseViewModel()
        
        WindowGroup {
            ContentView().environmentObject(login)
        }
    }
}
