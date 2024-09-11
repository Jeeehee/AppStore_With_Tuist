//
//  HomeInteractor.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RIBs
import RxSwift

import Usecase
import Entities
import Model
import Service

protocol HomePresentable: Presentable {
  var listener: HomePresentableListener? { get set }
  func bindRecentSearchHistory(_ history: [SearchHistory])
  func bindAppInfoSummary(_ informations: [AppInfoSummary])
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
  private let appSearchModelStream: AppSearchModelStream
  
  // MARK: - Initialization
  
  init(
    presenter: HomePresentable,
    appStoreUsecase: AppStoreUsecase,
    searchHistoryModelStream: SearchHistoryModelStream,
    appSearchModelStream: AppSearchModelStream
  ) {
    self.appStoreUsecase = appStoreUsecase
    self.searchHistoryModelStream = searchHistoryModelStream
    self.appSearchModelStream = appSearchModelStream
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
  
  // MARK: - Mutation
  
  func didTapSearchButtonClicked(_ keyword: String) {
    guard let request = makeURLRequest(with: keyword) else { return }
    appStoreUsecase.search(SearchResult.self, with: request)
      .catch ({ error in return .never() })
      .subscribe(with: self) { owner, apps in
        let summary = apps.results.map { $0.toAppInfoSummary() }
        let detail = apps.results.map { $0.toAppInfoDetail() }

        owner.appSearchModelStream
          .updateAppInfoSummary(with: summary)
        owner.appSearchModelStream
          .updateAppInfoDetail(with: detail)
        
        DispatchQueue.main.async {
          owner.presenter.bindAppInfoSummary(summary)
        }
      }
      .disposeOnDeactivate(interactor: self)
  }
  
  /// 실시간으로 검색어 유입
  func searchKeyword(_ keyword: String) {
    searchHistoryModelStream
      .searchHistoryStream
      .observe(on: MainScheduler.asyncInstance)
      .subscribe(with: self) { owner, history in
        let filterHistory = history.filter { $0.keyword.contains(keyword) }
        owner.presenter.bindRecentSearchHistory(filterHistory)
      }
      .disposeOnDeactivate(interactor: self)
  }
  
  func saveKeyword(_ keyword: String) {
    searchHistoryModelStream.updateSearchHistory(with: keyword)
    appStoreUsecase.saveSearchKeyword(keyword)
  }
  
  func didTapAppSummary(_ id: Int) {
    appSearchModelStream.selectedApp(id: id)
    router?.attachAppDetailRIB()
  }
  
  // MARK: - HomeRouting
  
  
  // MARK: - Listener
  
  func detachAppDetailRIB() {
    router?.detachAppDetailRIB()
  }

}

extension HomeInteractor {
  private func makeURLRequest(with keyword: String) -> URLRequest? {
    guard let query = QueryParam(term: keyword).toQueryParameters(),
          let api = APITarget.search.baseURL?.appendingQueryItems(query)
    else {
      return nil
    }
    return URLRequest.asURLRequest(api: api, method: APITarget.search.httpMethod, headers: APITarget.search.headers)
  }
}
