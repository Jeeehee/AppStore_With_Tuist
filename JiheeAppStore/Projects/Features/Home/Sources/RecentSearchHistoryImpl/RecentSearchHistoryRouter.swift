//
//  RecentSearchHistoryRouter.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

// MARK: - RecentSearchHistoryInteractable

protocol RecentSearchHistoryInteractable: Interactable {
  var router: RecentSearchHistoryRouting? { get set }
  var listener: RecentSearchHistoryListener? { get set }
}

// MARK: - RecentSearchHistoryViewControllable

protocol RecentSearchHistoryViewControllable: ViewControllable {
  
}

// MARK: - RecentSearchHistoryRouter

final class RecentSearchHistoryRouter:
  ViewableRouter<RecentSearchHistoryInteractable, RecentSearchHistoryViewControllable>,
  RecentSearchHistoryRouting
{
  
  // MARK: - Initialization
  
  override init(
    interactor: RecentSearchHistoryInteractable,
    viewController: RecentSearchHistoryViewControllable
  ) {
    super.init(
      interactor: interactor,
      viewController: viewController
    )
    interactor.router = self
  }
  
  // MARK: - RecentSearchHistoryRouting
}
