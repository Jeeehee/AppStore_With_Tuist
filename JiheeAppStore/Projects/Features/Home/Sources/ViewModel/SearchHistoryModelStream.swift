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

import Entities
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
  
  public func updateSearchHistory(_ history: [SearchHistory]) {
    searchHistoryRelay.accept(history)
  }
  
  public init() {}
}

유저가 검색 버튼을 누른다
키워드 저장

키워드 저장하고 다음 앱으로 넘기면

Search Result RIB에서 Load Data로 API 요청 및 결과 View에 뿌리는건 어떨까
API로 앱 검색
정보 도달시 Search Result RIB으로 라우터
