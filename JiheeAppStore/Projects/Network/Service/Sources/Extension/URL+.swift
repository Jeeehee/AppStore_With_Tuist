//
//  URL+.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public extension URL {
  func appendingQueryItems(_ items: [URLQueryItem]) -> Self {
    var urlComponent = URLComponents(
      url: self,
      resolvingAgainstBaseURL: true
    )
    
    urlComponent?.queryItems = items
    return urlComponent?.url ?? self
  }
}
