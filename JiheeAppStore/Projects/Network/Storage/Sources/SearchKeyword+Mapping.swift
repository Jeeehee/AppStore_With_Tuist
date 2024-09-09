//
//  SearchKeyword+Mapping.swift
//  Storage
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import CoreData

import Entities

// MARK: - Search keyword to viewModel

public extension SearchKeyword {
  func toDomain() -> SearchHistory {
    .init(keyword: self.keyword ?? "")
  }
}
