//
//  TargetDependency+SPM.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription

public extension TargetDependency {
  enum SPM: String, CaseIterable {
    case RxSwift
    case RxCocoa
    case RxRelay
    case RxTest
    case RxGesture
    case RIBs
    case SnapKit
    case Alamofire
    
    public var dependency: TargetDependency {
      .package(product: rawValue)
    }
    
    public static var allDependencies: [TargetDependency] {
      allCases.map { $0.dependency }
    }
  }
}
