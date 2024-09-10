//
//  APITarget.swift
//  Service
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public enum APITarget {
  case search
}

extension APITarget: Requestable {
  public var scheme: String {
    return "https"
  }
  
  public var host: String {
    return "itunes.apple.com"
  }
  
  public var path: String {
    "/search"
  }
  
  public var baseURL: URL? { makeBaseURL() }
  public var httpMethod: HTTPMethod { .get }
  public var headers: HTTPHeaders? { nil }
}
