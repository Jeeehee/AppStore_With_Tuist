//
//  AppComponent.swift
//  Application
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import Home
import AppSearchResult
import AppDetail

import Usecase
import UsecaseImpl
import Repository
import RepositoryImpl

import Service
import Storage

// MARK: - AppComponent

final class AppComponent:
  AppRootDependency,
  HomeDependency,
  SearchBarDependency,
  RecentSearchHistoryDependency
{
  
  // MARK: - Builder
  
  var homeBuilder: HomeBuildable {
    HomeBuilder(dependency: self)
  }
  
  var searchBarBuilder: SearchBarBuildable {
    SearchBarBuilder(dependency: self)
  }
  
  var recentSearchHistoryBuilder: RecentSearchHistoryBuildable {
    RecentSearchHistoryBuilder(dependency: self)
  }
  
  // MARK: - Repository
  
  let appSearchRepository: AppSearchRepository
  let searchHistoryRepository: SearchHistoryRepository
  
  // MARK: - Usecase
  
  let appStoreUsecase: AppStoreUsecase
  
  // MARK: - Network
  
  let networkAdapter: NetworkAdapter
  let storage: CoreDataSearchHistoryStorage
  
  // MARK: - Model Stream
  
  let searchHistoryModelStream: SearchHistoryModelStream
  
  // MARK: - Initialization
  
  init() {
    self.networkAdapter = NetworkAdapterImpl()
    self.storage = CoreDataSearchHistoryStorageImpl()
    self.appSearchRepository = AppSearchRepositoryImpl(session: networkAdapter)
    self.searchHistoryRepository = SearchHistoryRepositoryImpl(storage: storage)
    self.appStoreUsecase = AppStoreUsecaseImpl(appSearchRepository: appSearchRepository, searchHistoryRepository: searchHistoryRepository)
    self.searchHistoryModelStream = SearchHistoryModelStream()
  }
}
