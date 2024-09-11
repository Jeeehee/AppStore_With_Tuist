//
//  HomeBuilder.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import Usecase
import Entities

import AppDetail

final class HomeComponent: Component<HomeDependency> {
  fileprivate var recentSearchHistoryBuilder: RecentSearchHistoryBuildable {
    dependency.recentSearchHistoryBuilder
  }
  
  fileprivate var appDetailBuilder: AppDetailBuildable {
    dependency.appDetailBuilder
  }
  
  fileprivate var appStoreUsecase: AppStoreUsecase {
    dependency.appStoreUsecase
  }
  
  fileprivate var searchHistoryModelStream: SearchHistoryModelStream {
    dependency.searchHistoryModelStream
  }
  
  fileprivate var appSearchModelStream: AppSearchModelStream {
    dependency.appSearchModelStream
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
      searchHistoryModelStream: dependency.searchHistoryModelStream,
      appSearchModelStream: dependency.appSearchModelStream
    )
    interactor.listener = listener
    
    return HomeRouter(
      interactor: interactor,
      viewController: viewController,
      recentSearchHistoryBuilder: component.recentSearchHistoryBuilder,
      appDetailBuilder: component.appDetailBuilder
    )
  }
}
