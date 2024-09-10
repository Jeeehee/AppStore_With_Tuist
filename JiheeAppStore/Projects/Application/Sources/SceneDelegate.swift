//
//  SceneDelegate.swift
//  Application
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import RIBs

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  private var launchRouter: LaunchRouting?
  
  // MARK: - Function
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: scene)
    self.window = window
    
    configureAppLaunch()
  }
  
}

extension SceneDelegate {
  private func configureAppLaunch() {
    guard let window else { return }
    
    let appComponent = AppComponent()
    self.launchRouter = AppRootBuilder(dependency: appComponent).build()
    self.launchRouter?.launch(from: window)
  }
}
