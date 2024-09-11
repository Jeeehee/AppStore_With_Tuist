//
//  RecentSearchHistoryBuilder.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import Entities

public final class RecentSearchHistoryComponent: Component<RecentSearchHistoryDependency> {
  fileprivate var searchHistoryModelStream: SearchHistoryModelStream {
    dependency.searchHistoryModelStream
  }
}

// MARK: - Builder

public final class RecentSearchHistoryBuilder:
  Builder<RecentSearchHistoryDependency>,
  RecentSearchHistoryBuildable
{
  
  public override init(dependency: RecentSearchHistoryDependency) {
    super.init(dependency: dependency)
  }
  
  public func build(withListener listener: RecentSearchHistoryListener) -> RecentSearchHistoryRouting {
    let viewController = RecentSearchHistoryViewController()
    let interactor = RecentSearchHistoryInteractor(
      presenter: viewController,
      searchHistoryModelStream: dependency.searchHistoryModelStream
    )
    interactor.listener = listener
    return RecentSearchHistoryRouter(interactor: interactor, viewController: viewController)
  }
}
