//
//  AppStoreUsecaseImpl.swift
//  UsecaseImpl
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RxSwift

import Usecase
import Entities
import Repository

public final class AppStoreUsecaseImpl: AppStoreUsecase {
  private let appSearchRepository: AppSearchRepository
  private let searchHistoryRepository: SearchHistoryRepository
  
  public init(
    appSearchRepository: AppSearchRepository,
    searchHistoryRepository: SearchHistoryRepository
  ) {
    self.appSearchRepository = appSearchRepository
    self.searchHistoryRepository = searchHistoryRepository
  }
}

// MARK: - AppSearchRepository

extension AppStoreUsecaseImpl {
  public func search<T: Decodable>(_ type: T.Type, with: URLRequest) -> Single<T> {
    Single<T>.create { [weak self] observer in
      guard let self else { return Disposables.create() }
      
      return self.appSearchRepository
        .search(type.self, with: with)
        .subscribe { observer($0) }
    }
  }
}

// MARK: - SearchHistoryRepository

extension AppStoreUsecaseImpl {
  public func fetchRecentSearchHistory() -> Single<[SearchHistory]> {
    Single<[SearchHistory]>.create { [weak self] observer in
      guard let self else { return Disposables.create() }
      
      return self.searchHistoryRepository
        .fetchRecentSearchHistory()
        .subscribe { observer($0) }
    }
  }
  
  public func saveSearchKeyword(_ keyword: String) {
    searchHistoryRepository.saveSearchKeyword(keyword)
  }
}
