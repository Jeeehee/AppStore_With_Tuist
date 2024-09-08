//
//  Modules.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import Foundation

public enum Modules {
  case Features(Features)
  case Domain(Domain)
  case Network(Network)
  case Foundation(Foundation)
  
  public var name: String {
    switch self {
    case .Features(let features):
      return features.name
    case .Domain(let domain):
      return domain.name
    case .Network(let network):
      return network.name
    case .Foundation(let foundation):
      return foundation.name
    }
  }
  
  public var path: String {
    switch self {
    case .Features(let features):
      return features.path
    case .Domain(let domain):
      return domain.path
    case .Network(let network):
      return network.path
    case .Foundation(let foundation):
      return foundation.path
    }
  }
  
}
