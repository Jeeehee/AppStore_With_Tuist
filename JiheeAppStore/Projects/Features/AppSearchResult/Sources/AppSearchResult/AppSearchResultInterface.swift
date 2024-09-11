//
//  AppSearchResultInterface.swift
//  AppSearchResult
//
//  Created by Jihee hwang on 9/10/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import Usecase

// MARK: - AppSearchResultBuildable

public protocol AppSearchResultBuildable: Buildable {
    func build(withListener listener: AppSearchResultListener) -> AppSearchResultRouting
}

// MARK: - AppSearchResultRouting

public protocol AppSearchResultRouting: ViewableRouting {

}

// MARK: - AppSearchResultListener

public protocol AppSearchResultListener: AnyObject {

}

// MARK: - AppSearchResultDependency

public protocol AppSearchResultDependency: Dependency {
  var appStoreUsecase: AppStoreUsecase { get }
//  var searchHistoryModelStream: SearchHistoryModelStream { get }
}

