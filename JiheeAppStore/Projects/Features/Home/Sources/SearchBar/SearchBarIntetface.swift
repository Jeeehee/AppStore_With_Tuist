//
//  SearchBarIntetface.swift
//  Home
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import RIBs

import Usecase

// MARK: - SearchBarBuildable

public protocol SearchBarBuildable: Buildable {
    func build(withListener listener: SearchBarListener) -> SearchBarRouting
}

// MARK: - SearchBarRouting

public protocol SearchBarRouting: ViewableRouting {

}

// MARK: - SearchBarListener

public protocol SearchBarListener: AnyObject {

}

// MARK: - SearchBarDependency

public protocol SearchBarDependency: Dependency {
  var appStoreUsecase: AppStoreUsecase { get }
  var searchHistoryModelStream: SearchHistoryModelStream { get }
}
