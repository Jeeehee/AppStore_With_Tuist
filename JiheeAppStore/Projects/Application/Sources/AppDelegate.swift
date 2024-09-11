//
//  AppDelegate.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import UIKit

import UI
import Storage

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    CoreDataStorage.shared.saveContext()
  }
  
  // MARK: UISceneSession Lifecycle
  
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
}
