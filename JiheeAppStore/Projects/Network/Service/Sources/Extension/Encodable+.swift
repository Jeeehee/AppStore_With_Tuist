//
//  Encodable+.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

extension Encodable {
  public func toJson<E>(_ value: E) throws -> Data where E: Encodable {
    try JSONEncoder().encode(value)
  }
  
  public func toQueryParameters() -> [URLQueryItem]? {
      guard let data = try? JSONEncoder().encode(self),
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
      else {
          return nil
      }
      
      return json.map { key, value in
          URLQueryItem(name: key, value: String(describing: value))
      }
  }
}
