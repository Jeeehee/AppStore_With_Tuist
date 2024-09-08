//
//  AppRootRouter.swift
//  Application
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

// MARK: - AppRootInteractable

protocol AppRootInteractable: Interactable {
  var router: AppRootRouting? { get set }
  var listener: AppRootListener? { get set }
}

// MARK: - AppRootViewControllable

protocol AppRootViewControllable: ViewControllable {
  
}

// MARK: - AppRootRouter

final class AppRootRouter:
  LaunchRouter<AppRootInteractable, AppRootViewControllable>,
  AppRootRouting
{
  
  override init(interactor: AppRootInteractable, viewController: AppRootViewControllable) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
