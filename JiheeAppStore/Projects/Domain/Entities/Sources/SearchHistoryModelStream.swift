//
//  SearchHistoryModelStream.swift
//  Home
//
//  Created by Jihee hwang on 9/10/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RxSwift
import RxRelay

import AppFoundation

public final class SearchHistoryModelStream {
  
  // MARK: - Properties
  
  public var searchHistoryStream: Observable<[SearchHistory]> { searchHistoryRelay.asObservable() }
  private let searchHistoryRelay = BehaviorRelay<[SearchHistory]>(value: [])
  
  // MARK: - Update
  
  /// Storage에서 읽어올때
  public func updateSearchHistory(_ history: [SearchHistory]) {
    searchHistoryRelay.accept(history)
  }
  
  public func updateSearchHistory(with keyword: String) {
    var currentHistory = searchHistoryRelay.value.filter { $0.keyword != keyword }
    currentHistory.insert(.init(keyword: keyword), at: 0)
    searchHistoryRelay.accept(currentHistory)
  }
  
  public init() {}
}
