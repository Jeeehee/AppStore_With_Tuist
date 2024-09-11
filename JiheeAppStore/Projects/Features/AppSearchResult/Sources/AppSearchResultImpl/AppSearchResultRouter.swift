//
//  AppSearchResultRouter.swift
//  AppSearchResult
//
//  Created by Jihee hwang on 9/10/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

// MARK: - AppSearchResultInteractable

protocol AppSearchResultInteractable: Interactable {
    var router: AppSearchResultRouting? { get set }
    var listener: AppSearchResultListener? { get set }
}

// MARK: - AppSearchResultViewControllable

protocol AppSearchResultViewControllable: ViewControllable {
  func bindSearchResult()
}

final class AppSearchResultRouter:
  ViewableRouter<AppSearchResultInteractable, AppSearchResultViewControllable>,
  AppSearchResultRouting {

    override init(interactor: AppSearchResultInteractable, viewController: AppSearchResultViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
