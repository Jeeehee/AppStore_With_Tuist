//
//  TargetDependency+Module.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription

public extension TargetDependency {
  
  enum Module {
    case type(Modules)
    
    public var dependency: TargetDependency {
      switch self {
      case .type(let module):
        return .project(
          target: module.name,
          path: .relativeToRoot(module.path)
        )
      }
    }
    
    public static var allDependencies: [TargetDependency] {
      getAllFeaturesDependencies() +
      getAllDomainDependencies() +
      getAllNetworkDependencies() +
      getAllFoundationDependencies() +
      SPM.allDependencies
    }
    
    // MARK: - Get All Dependencies
    
    private static func getAllFeaturesDependencies() -> [TargetDependency] {
      Features
        .allCases
        .map { Module.type(.Features($0)).dependency }
    }
    
    private static func getAllDomainDependencies() -> [TargetDependency] {
      Domain
        .allCases
        .map { Module.type(.Domain($0)).dependency }
    }
    
    private static func getAllNetworkDependencies() -> [TargetDependency] {
      Network
        .allCases
        .map { Module.type(.Network($0)).dependency }
    }
    
    private static func getAllFoundationDependencies() -> [TargetDependency] {
      Foundation
        .allCases
        .map { Module.type(.Foundation($0)).dependency }
    }
    
  }
}
