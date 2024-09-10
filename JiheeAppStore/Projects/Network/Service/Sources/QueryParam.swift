//
//  QueryParam.swift
//  Service
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public struct QueryParam: Encodable {
  let term: String
  let country: String = "kr"
  let entity: String = "software"
  
  public init(term: String) {
    self.term = term
  }
}
