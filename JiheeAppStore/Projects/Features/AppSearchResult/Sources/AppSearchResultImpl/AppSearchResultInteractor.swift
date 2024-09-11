//
//  AppSearchResultInteractor.swift
//  AppSearchResult
//
//  Created by Jihee hwang on 9/10/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs
import RxSwift

// MARK: - AppSearchResultPresentable

protocol AppSearchResultPresentable: Presentable {
  var listener: AppSearchResultPresentableListener? { get set }
  func bindSearchResult()
}

// MARK: - AppSearchResultInteractor

final class AppSearchResultInteractor:
  PresentableInteractor<AppSearchResultPresentable>,
  AppSearchResultInteractable,
  AppSearchResultPresentableListener
{
  
  weak var router: AppSearchResultRouting?
  weak var listener: AppSearchResultListener?
  
  override init(presenter: AppSearchResultPresentable) {
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
  }
  
  override func willResignActive() {
    super.willResignActive()
  }
  
  func loadData() {
  }
}
