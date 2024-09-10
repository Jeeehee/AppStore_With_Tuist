//
//  AppRoot.swift
//  Application
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

// MARK: - AppRootBuildable

public protocol AppRootBuildable: Buildable {
  func build() -> LaunchRouting
}

// MARK: - AppRootRouting

public protocol AppRootRouting: ViewableRouting {
  func attachHome()
  func detachHome()
}

// MARK: - AppRootListener

public protocol AppRootListener: AnyObject {
  
}
