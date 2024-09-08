//
//  Decodable+.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

extension Decodable {
  public func decode<D>(
    _ type: D.Type,
    _ from: Data?
  ) throws -> D where D: Decodable {
    guard let from else {
      throw NetworkError.decodeError
    }
    
    return try JSONDecoder().decode(D.self, from: from)
  }
}
