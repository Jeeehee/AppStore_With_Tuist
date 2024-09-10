//
//  Home.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import Usecase

// MARK: - HomeBuildable

public protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> HomeRouting
}

// MARK: - HomeRouting

public protocol HomeRouting: ViewableRouting {

}

// MARK: - HomeListener

public protocol HomeListener: AnyObject {

}

// MARK: - HomeDependency

public protocol HomeDependency: Dependency {
  var searchBarBuilder: SearchBarBuildable { get }
  var recentSearchHistoryBuilder: RecentSearchHistoryBuildable { get }
  var appStoreUsecase: AppStoreUsecase { get }
  var searchHistoryModelStream: SearchHistoryModelStream { get }
}
