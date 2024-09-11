//
//  AppRootRouter.swift
//  Application
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

import RIBs

import AppFoundation
import Home

// MARK: - AppRootInteractable

protocol AppRootInteractable: Interactable, HomeListener {
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
  private var homeBuilder: HomeBuildable
  private var homeRouter: HomeRouting?
  
  // MARK: - Initialization
  
  init(
    interactor: AppRootInteractable,
    viewController: AppRootViewControllable,
    homeBuilder: HomeBuildable
  ) {
    self.homeBuilder = homeBuilder
    
    super.init(
      interactor: interactor,
      viewController: viewController
    )
    
    interactor.router = self
  }
  
  // MARK: - AppRootRouting
  
  func attachHome() {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
      guard let self,
            homeRouter == nil else {
        return
      }
      
      let router = self.homeBuilder
        .build(withListener: interactor)
      
      self.homeRouter = router
      attachChild(router)
      
      let navigationController = NavigationViewControllable(root: router.viewControllable)
      viewController.presentFullScreen(navigationController)
    }
  }
  
  func detachHome() {
    guard let router = homeRouter else {
      return
    }
    
    homeRouter = nil
    detachChild(router)
  }
}
