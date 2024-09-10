//
//  SearchBarInteractor.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RIBs
import RxSwift

import Usecase
import Model
import Service

protocol SearchBarPresentable: Presentable {
  var listener: SearchBarPresentableListener? { get set }
  
}

final class SearchBarInteractor:
  PresentableInteractor<SearchBarPresentable>,
  SearchBarInteractable,
  SearchBarPresentableListener {
  
  weak var router: SearchBarRouting?
  weak var listener: SearchBarListener?
  
  private var state: AppSearchViewModel
  
  private let appStoreUsecase: AppStoreUsecase
  private let searchHistoryModelStream: SearchHistoryModelStream
  
  // MARK: - Initialization
  
  init(
    initialState: AppSearchViewModel,
    presenter: SearchBarPresentable,
    appStoreUsecase: AppStoreUsecase,
    searchHistoryModelStream: SearchHistoryModelStream
  ) {
    self.state = initialState
    self.appStoreUsecase = appStoreUsecase
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
  
  // MARK: - SearchBarRouting
  
  // MARK: - Mutation
  
  func didTapSearchButtonClicked(_ keyword: String) {
    saveKeyword(keyword)
    
    guard let request = makeURLRequest(with: keyword) else { return }
    appStoreUsecase.search(SearchResult.self, with: request)
      .catch ({ error in return .never() })
      .subscribe(with: self) { owner, apps in
        var newState = owner.state
        newState.appInfoSummary = apps.results.map { $0.toAppInfoSummary() }
        newState.appInfoDetail = apps.results.map { $0.toAppInfoDetail() }
        owner.state = newState
      }
      .disposeOnDeactivate(interactor: self)
  }
  
  func searchKeyword(_ keyword: String) {
    print(keyword)
  }
  
  private func saveKeyword(_ keyword: String) {
    searchHistoryModelStream.updateSearchHistory(with: keyword)
    appStoreUsecase.saveSearchKeyword(keyword)
  }
  
  private func makeURLRequest(with keyword: String) -> URLRequest? {
    guard let query = QueryParam(term: keyword).toQueryParameters(),
          let api = APITarget.search.baseURL?.appendingQueryItems(query)
    else {
      return nil
    }
    return URLRequest.asURLRequest(api: api, method: APITarget.search.httpMethod, headers: APITarget.search.headers)
  }
}
