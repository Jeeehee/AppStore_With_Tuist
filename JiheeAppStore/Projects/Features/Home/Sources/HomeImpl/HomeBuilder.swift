//
//  HomeBuilder.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import Usecase

final class HomeComponent: Component<HomeDependency> {
  fileprivate var searchBarBuilder: SearchBarBuildable {
    dependency.searchBarBuilder
  }
  
  fileprivate var recentSearchHistoryBuilder: RecentSearchHistoryBuildable {
    dependency.recentSearchHistoryBuilder
  }
  
  fileprivate var appStoreUsecase: AppStoreUsecase {
    dependency.appStoreUsecase
  }
  
  fileprivate var searchHistoryModelStream: SearchHistoryModelStream {
    dependency.searchHistoryModelStream
  }
}

// MARK: - Builder

public final class HomeBuilder:
  Builder<HomeDependency>,
  HomeBuildable {
  
  public override init(dependency: HomeDependency) {
    super.init(dependency: dependency)
  }
  
  public func build(withListener listener: HomeListener) -> HomeRouting {
    let component = HomeComponent(dependency: dependency)
    let viewController = HomeViewController()
    let interactor = HomeInteractor(
      presenter: viewController,
      appStoreUsecase: dependency.appStoreUsecase,
      searchHistoryModelStream: dependency.searchHistoryModelStream
    )
    interactor.listener = listener
    return HomeRouter(
      interactor: interactor,
      viewController: viewController,
      searchBarBuilder: component.searchBarBuilder,
      recentSearchHistoryBuilder: component.recentSearchHistoryBuilder
    )
  }
}
