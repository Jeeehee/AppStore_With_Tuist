//
//  AppDetailBuilder.swift
//  AppDetail
//
//  Created by Jihee hwang on 9/11/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import Entities

final class AppDetailComponent: Component<AppDetailDependency> {
  fileprivate var appSearchModelStream: AppSearchModelStream {
    dependency.appSearchModelStream
  }
}

// MARK: - Builder

public final class AppDetailBuilder: Builder<AppDetailDependency>, AppDetailBuildable {
  
  public override init(dependency: AppDetailDependency) {
    super.init(dependency: dependency)
  }
  
  public func build(withListener listener: AppDetailListener) -> AppDetailRouting {
    let viewController = AppDetailViewController()
    let interactor = AppDetailInteractor(
      presenter: viewController,
      appSearchModelStream: dependency.appSearchModelStream
    )
    interactor.listener = listener
    return AppDetailRouter(interactor: interactor, viewController: viewController)
  }
}
