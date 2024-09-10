//
//  SearchHistoryRepository.swift
//  Repository
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RxSwift

import Entities

public protocol SearchHistoryRepository {
  func fetchRecentSearchHistory() -> Single<[SearchHistory]>
  func saveSearchKeyword(_ keyword: String)
}
