//
//  HomeRouter.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import AppFoundation

import AppDetail

// MARK: - HomeInteractable

protocol HomeInteractable:
  Interactable,
  RecentSearchHistoryListener,
  AppDetailListener
{
  var router: HomeRouting? { get set }
  var listener: HomeListener? { get set }
}

// MARK: - HomeViewControllable

protocol HomeViewControllable: ViewControllable {
  func addRecentSearchHistoryView(_ view: ViewControllable)
}

final class HomeRouter:
  ViewableRouter<HomeInteractable, HomeViewControllable>,
  HomeRouting
{
  // MARK: - Properties

  private var recentSearchHistoryBuilder: RecentSearchHistoryBuildable
  private var recentSearchHistoryRouter: RecentSearchHistoryRouting?
  
  private var appDetailBuilder: AppDetailBuildable
  private var appDetailRouter: AppDetailRouting?
  
  // MARK: - Initialization
  
  init(
    interactor: HomeInteractable,
    viewController: HomeViewControllable,
    recentSearchHistoryBuilder: RecentSearchHistoryBuildable,
    appDetailBuilder: AppDetailBuildable
  ) {
    self.recentSearchHistoryBuilder = recentSearchHistoryBuilder
    self.appDetailBuilder = appDetailBuilder
    
    super.init(
      interactor: interactor,
      viewController: viewController
    )
    
    interactor.router = self
  }
  
  override func didLoad() {
    super.didLoad()
    
    attachRecentSearchHistoryRIB()
  }
  
  // MARK: - HomeRouting
  
  func attachRecentSearchHistoryRIB() {
    guard recentSearchHistoryRouter == nil else { return }
    
    let router = recentSearchHistoryBuilder
      .build(withListener: interactor)
    recentSearchHistoryRouter = router
    attachChild(router)
    viewController.addRecentSearchHistoryView(router.viewControllable)
  }

  func attachAppDetailRIB() {
    guard appDetailRouter == nil else { return }
    
    let router = appDetailBuilder
      .build(withListener: interactor)
    
    appDetailRouter = router
    attachChild(router)
    viewController.pushViewController(router.viewControllable)
  }
  
  func detachAppDetailRIB() {
    guard let router = appDetailRouter else { return }
    appDetailRouter = nil
    detachChild(router)
    viewController.popToRoot(animated: false)
  }

}
