//
//  AppRootBuilder.swift
//  Application
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import Home

protocol AppRootDependency: Dependency {
  var homeBuilder: HomeBuildable { get }
}

final class AppRootComponent: Component<AppRootDependency> {
  
}

// MARK: - Builder

final class AppRootBuilder:
  Builder<AppRootDependency>,
  AppRootBuildable
{
  
  override init(dependency: AppRootDependency) {
    super.init(dependency: dependency)
  }
  
  func build() -> LaunchRouting {
    let viewController = AppRootViewController()
    let interactor = AppRootInteractor(presenter: viewController)
    
    return AppRootRouter(
      interactor: interactor,
      viewController: viewController,
      homeBuilder: dependency.homeBuilder
    )
  }
}
