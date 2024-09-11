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
  
  public func updateSearchHistory(with keyword: String) {
    var currentHistory = searchHistoryRelay.value
    currentHistory.insert(.init(keyword: keyword), at: 0)
    searchHistoryRelay.accept(currentHistory)
  }
  
  // MARK: - Update
  
  public func updateSearchHistory(_ history: [SearchHistory]) {
    searchHistoryRelay.accept(history)
  }
  
  public init() {}
}
