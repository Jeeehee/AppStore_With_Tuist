//
//  HomeRouter.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import AppFoundation

// MARK: - HomeInteractable

protocol HomeInteractable:
  Interactable,
  SearchBarListener,
  RecentSearchHistoryListener
{
  var router: HomeRouting? { get set }
  var listener: HomeListener? { get set }
}

// MARK: - HomeViewControllable

protocol HomeViewControllable: ViewControllable {
  func addSearchBarView(_ view: ViewControllable)
  func addRecentSearchHistoryView(_ view: ViewControllable)
}

final class HomeRouter:
  ViewableRouter<HomeInteractable, HomeViewControllable>,
  HomeRouting
{
  // MARK: - Properties
  
  private var searchBarBuilder: SearchBarBuildable
  private var searchBarRouter: SearchBarRouting?
  
  private var recentSearchHistoryBuilder: RecentSearchHistoryBuildable
  private var recentSearchHistoryRouter: RecentSearchHistoryRouting?
  
  // MARK: - Initialization
  
  init(
    interactor: HomeInteractable,
    viewController: HomeViewControllable,
    searchBarBuilder: SearchBarBuildable,
    recentSearchHistoryBuilder: RecentSearchHistoryBuildable
  ) {
    self.searchBarBuilder = searchBarBuilder
    self.recentSearchHistoryBuilder = recentSearchHistoryBuilder
    
    super.init(
      interactor: interactor,
      viewController: viewController
    )
    
    interactor.router = self
  }
  
  override func didLoad() {
    super.didLoad()
    attachSearchBar()
    attachRecentSearchHistory()
  }
  
  // MARK: - HomeRouting
  
  func attachSearchBar() {
    guard searchBarRouter == nil else { return }
    
    let router = searchBarBuilder
      .build(withListener: interactor)
    searchBarRouter = router
    attachChild(router)
    
    let navigationController = NavigationViewControllable(root: router.viewControllable)
    viewController.addSearchBarView(navigationController)
  }
  
  func attachRecentSearchHistory() {
    guard recentSearchHistoryRouter == nil else { return }
    
    let router = recentSearchHistoryBuilder
      .build(withListener: interactor)
    recentSearchHistoryRouter = router
    attachChild(router)
    viewController.addRecentSearchHistoryView(router.viewControllable)
  }
}
