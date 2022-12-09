//
//  RecipeApp.swift
//  Recipe
//
//  Created by William Ballard on 11/27/22.
//

import SwiftUI
import Firebase

//class AppDelegate: NSObject, UIApplicationDelegate {
//
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//      FirebaseApp.configure()
//      return true
//  }
//}

@main
struct RecipeApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var user = UserModel()
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
            //.environmentObject(user)
        }
    }
}
