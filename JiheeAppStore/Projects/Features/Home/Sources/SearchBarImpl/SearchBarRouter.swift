//
//  SearchBarRouter.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

protocol SearchBarInteractable: Interactable {
  var router: SearchBarRouting? { get set }
  var listener: SearchBarListener? { get set }
}

// MARK: - SearchBarViewControllable

protocol SearchBarViewControllable: ViewControllable {
}

final class SearchBarRouter:
  ViewableRouter<SearchBarInteractable,
  SearchBarViewControllable>,
  SearchBarRouting
{
  // MARK: - Initialization
  
  override init(
    interactor: SearchBarInteractable,
    viewController: SearchBarViewControllable
  ) {
    super.init(
      interactor: interactor,
      viewController: viewController
    )
    interactor.router = self
  }
  
  // MARK: - SearchBarRouting
}
