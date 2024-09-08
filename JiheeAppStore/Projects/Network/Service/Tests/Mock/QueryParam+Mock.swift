//
//  QueryParamMock.swift
//  ServiceTests
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

struct QueryParamMock: Encodable {
  let term: String
  let country: String = "kr"
  let entity: String = "software"
  
  init(term: String) {
    self.term = term
  }
}
