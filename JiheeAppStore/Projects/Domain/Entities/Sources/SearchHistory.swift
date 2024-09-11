//
//  SearchHistory.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import Foundation

public struct SearchHistory: Equatable {
  public let keyword: String
  
  public init(keyword: String) {
    self.keyword = keyword
  }
}

public extension SearchHistory {
  static let mock: [Self] = [.init(keyword: "카카오뱅크"),
                             .init(keyword: "카카오"),
                             .init(keyword: "날씨"),
                             .init(keyword: "캘린더ㅏ"),
                             .init(keyword: "선물")
  ]
}
