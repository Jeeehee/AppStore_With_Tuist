//
//  HTTPHeaders.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import AppFoundation

public struct HTTPHeaders: PropertyBuilderCompatible {
  
  private var headers: [HTTPHeader] = []
  
  public init() {}
  
  public init(_ headers: [HTTPHeader]) {
    headers.forEach { update($0) }
  }

  public var dictionary: [String: String] {
    let namesAndValues = headers.map { ($0.name, $0.value) }
    
    return Dictionary(namesAndValues, uniquingKeysWith: { _, last in last })
  }
  
  public mutating func update(_ header: HTTPHeader) {
    guard let index = headers.firstIndex(of: header) else {
      headers.append(header)
      return
    }
    
    headers.replaceSubrange(index...index, with: [header])
  }

}
