//
//  CoreDataSearchHistoryStorage.swift
//  Storage
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import Entities

public protocol CoreDataSearchHistoryStorage {
  func createData(keyword: String)
  func readSearchHistory(limit: Int) async -> [SearchHistory]
  func deleteAll()
}
