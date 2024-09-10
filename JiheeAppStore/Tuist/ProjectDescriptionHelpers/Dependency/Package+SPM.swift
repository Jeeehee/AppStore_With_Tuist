//
//  Package+SPM.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription

public extension Package {
  enum SPM: CaseIterable {
    case RxSwift
    case RxCocoa
    case RxRelay
    case RxGesture
    case RIBs
    case SnapKit
    
    public var dependency: Package {
      switch self {
      case .RxSwift, .RxCocoa, .RxRelay:
        return .package(url: "https://github.com/ReactiveX/RxSwift", .exact("6.5.0"))
      case .RxGesture:
        return .package(url: "https://github.com/RxSwiftCommunity/RxGesture.git", .exact("4.0.4"))
      case .RIBs:
        return .package(url: "https://github.com/uber/RIBs.git", .exact("0.15.1"))
      case .SnapKit:
         return .package(url: "https://github.com/SnapKit/SnapKit.git", .exact("5.6.0"))
      }
    }
    
    public static var allPackages: [Package] {
        return allCases.map { $0.dependency }
    }
  }
}
