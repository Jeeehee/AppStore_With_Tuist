//
//  Storage.swift
//  Storage
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public protocol Storage {
  func createData(keyword: String)
  func readRecentSearcheKeywords(limit: Int) -> [SearchKeyword]
  func deleteAll()
}
