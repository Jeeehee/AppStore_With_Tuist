//
//  SearchHistoryRepositoryMock.swift
//  UsecaseImpl
//
//  Created by Jihee hwang on 9/11/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RxSwift

import Repository
import Service
import Entities

public final class SearchHistoryRepositoryMock: SearchHistoryRepository {
  
  public init() {}
  
  public func fetchRecentSearchHistory() -> Single<[SearchHistory]> {
    Single<[SearchHistory]>.create { observer in
      observer(.success(SearchHistory.mock))
      return Disposables.create()
    }
  }
  
  public func saveSearchKeyword(_ keyword: String) { }
}
