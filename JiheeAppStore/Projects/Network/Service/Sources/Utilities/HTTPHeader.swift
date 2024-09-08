//
//  HTTPHeader.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import AppFoundation

public struct HTTPHeader:
  Hashable,
  PropertyBuilderCompatible
{
  public var name: String = ""
  public var value: String = ""
  
  public init(name: String, value: String) {
    self.name = name
    self.value = value
  }
  
  public init() {}
}
