//
//  RecentSearchHistoryInteractor.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs
import RxSwift
import RxCocoa

import Entities

protocol RecentSearchHistoryPresentable: Presentable {
  var listener: RecentSearchHistoryPresentableListener? { get set }
  func bindRecentSearchHistory(_ history: [SearchHistory])
}

final class RecentSearchHistoryInteractor:
  PresentableInteractor<RecentSearchHistoryPresentable>,
  RecentSearchHistoryInteractable,
  RecentSearchHistoryPresentableListener {
  
  weak var router: RecentSearchHistoryRouting?
  weak var listener: RecentSearchHistoryListener?
  
  private let searchHistoryModelStream: SearchHistoryModelStream
  
  // MARK: - Initialization
  
  init(
    presenter: RecentSearchHistoryPresentable,
    searchHistoryModelStream: SearchHistoryModelStream
  ) {
    self.searchHistoryModelStream = searchHistoryModelStream
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
    searchHistoryModelStream
      .searchHistoryStream
      .observe(on: MainScheduler.asyncInstance)
      .subscribe(with: self) { owner, history in
        owner.presenter.bindRecentSearchHistory(history)
      }
      .disposeOnDeactivate(interactor: self)
  }
  
  // MARK: - RecentSearchHistoryRouting
}
