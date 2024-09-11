//
//  RecentSearchHistoryInterface.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import Entities

// MARK: - RecentSearchHistoryBuildable

public protocol RecentSearchHistoryBuildable: Buildable {
  func build(withListener listener: RecentSearchHistoryListener) -> RecentSearchHistoryRouting
}

// MARK: - RecentSearchHistoryRouting

public protocol RecentSearchHistoryRouting: ViewableRouting {
  
}

// MARK: - RecentSearchHistoryListener

public protocol RecentSearchHistoryListener: AnyObject {
  
}

// MARK: - RecentSearchHistoryDependency

public protocol RecentSearchHistoryDependency: Dependency {
  var searchHistoryModelStream: SearchHistoryModelStream { get }
}
