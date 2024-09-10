//
//  HomeInteractor.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs
import RxSwift

import Usecase

protocol HomePresentable: Presentable {
  var listener: HomePresentableListener? { get set }
}

final class HomeInteractor:
  PresentableInteractor<HomePresentable>,
  HomeInteractable,
  HomePresentableListener
{
  
  weak var router: HomeRouting?
  weak var listener: HomeListener?
  
  private let appStoreUsecase: AppStoreUsecase
  private let searchHistoryModelStream: SearchHistoryModelStream
  
  // MARK: - Initialization
  
  init(
    presenter: HomePresentable,
    appStoreUsecase: AppStoreUsecase,
    searchHistoryModelStream: SearchHistoryModelStream
  ) {
    self.appStoreUsecase = appStoreUsecase
    self.searchHistoryModelStream = searchHistoryModelStream
    super.init(presenter: presenter)
    presenter.listener = self
  }
  
  override func didBecomeActive() {
    super.didBecomeActive()
    
    fetchSearchHistory()
  }
  
  override func willResignActive() {
    super.willResignActive()
  }
  
  private func fetchSearchHistory() {
    appStoreUsecase.fetchRecentSearchHistory()
      .catch ({ error in return .never() })
      .subscribe(with: self) { owner, history in
        owner.searchHistoryModelStream.updateSearchHistory(history)
      }
      .disposeOnDeactivate(interactor: self)
  }
  
  // MARK: - HomeRouting
}
