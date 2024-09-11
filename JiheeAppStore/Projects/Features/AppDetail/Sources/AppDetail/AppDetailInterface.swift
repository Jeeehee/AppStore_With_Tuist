//
//  AppDetailInterface.swift
//  AppDetail
//
//  Created by Jihee hwang on 9/11/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RIBs

import Entities

// MARK: - AppDetailBuildable

public protocol AppDetailBuildable: Buildable {
    func build(withListener listener: AppDetailListener) -> AppDetailRouting
}

// MARK: - AppDetailRouting

public protocol AppDetailRouting: ViewableRouting {

}

// MARK: - AppDetailListener

public protocol AppDetailListener: AnyObject {
  func detachAppDetailRIB()
}

// MARK: - AppDetailDependency

public protocol AppDetailDependency: Dependency {
  var appSearchModelStream: AppSearchModelStream { get }
}
