//
//  SearchBarBuilder.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import Usecase

public final class SearchBarComponent: Component<SearchBarDependency> {
  fileprivate let initialState: AppSearchViewModel = .init()
  
  fileprivate var appStoreUsecase: AppStoreUsecase {
    dependency.appStoreUsecase
  }
  
  fileprivate var searchHistoryModelStream: SearchHistoryModelStream {
    dependency.searchHistoryModelStream
  }
}

// MARK: - Builder

public final class SearchBarBuilder:
  Builder<SearchBarDependency>,
  SearchBarBuildable
{
  
  public override init(dependency: SearchBarDependency) {
    super.init(dependency: dependency)
  }
  
  public func build(withListener listener: SearchBarListener) -> SearchBarRouting {
    let component = SearchBarComponent(dependency: dependency)
    let viewController = SearchBarViewController()
    let interactor = SearchBarInteractor(
      initialState: component.initialState,
      presenter: viewController,
      appStoreUsecase: dependency.appStoreUsecase,
      searchHistoryModelStream: dependency.searchHistoryModelStream
    )
    interactor.listener = listener
    return SearchBarRouter(interactor: interactor, viewController: viewController)
  }
}
