//
//  AppSearchResultBuilder.swift
//  AppSearchResult
//
//  Created by Jihee hwang on 9/10/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

public final class AppSearchResultComponent: Component<AppSearchResultDependency> {
  
}

// MARK: - Builder

public final class AppSearchResultBuilder:
  Builder<AppSearchResultDependency>,
  AppSearchResultBuildable
{
  
  public override init(dependency: AppSearchResultDependency) {
    super.init(dependency: dependency)
  }
  
  public func build(withListener listener: AppSearchResultListener) -> AppSearchResultRouting {
    let component = AppSearchResultComponent(dependency: dependency)
    let viewController = AppSearchResultViewController()
    let interactor = AppSearchResultInteractor(presenter: viewController)
    interactor.listener = listener
    return AppSearchResultRouter(interactor: interactor, viewController: viewController)
  }
}
