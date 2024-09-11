//
//  AppDetailRouter.swift
//  AppDetail
//
//  Created by Jihee hwang on 9/11/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

// MARK: - AppDetailInteractable

protocol AppDetailInteractable: Interactable {
  var router: AppDetailRouting? { get set }
  var listener: AppDetailListener? { get set }
}

// MARK: - AppDetailViewControllable

protocol AppDetailViewControllable: ViewControllable {
  
}

final class AppDetailRouter:
  ViewableRouter<AppDetailInteractable, AppDetailViewControllable>,
  AppDetailRouting
{
  
  override init(
    interactor: AppDetailInteractable,
    viewController: AppDetailViewControllable
  ) {
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
}
