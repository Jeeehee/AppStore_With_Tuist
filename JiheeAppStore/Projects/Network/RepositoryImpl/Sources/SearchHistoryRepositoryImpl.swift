//
//  SearchHistoryRepositoryImpl.swift
//  RepositoryImpl
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RxSwift

import Storage
import Entities
import Repository

public final class SearchHistoryRepositoryImpl: SearchHistoryRepository {
  private let storage: CoreDataSearchHistoryStorage
  
  // MARK: - Initialization
  
  public init(storage: CoreDataSearchHistoryStorage) {
    self.storage = storage
  }
  
  // MARK: - SearchHistoryRepository
  
  public func fetchRecentSearchHistory() -> Single<[SearchHistory]> {
    Single<[SearchHistory]>.create { [weak self] observer in
      guard let self else { return Disposables.create() }
      
      Task {
        let result = await self.storage.readSearchHistory(limit: 10)
        observer(.success(result))
      }
      
      return Disposables.create()
    }
  }
  
  public func saveSearchKeyword(_ keyword: String) {
    storage.createData(keyword: keyword)
  }
}
