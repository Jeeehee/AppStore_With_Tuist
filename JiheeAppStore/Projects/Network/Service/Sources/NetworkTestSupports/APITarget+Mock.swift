//
//  APITarget+Mock.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import Model

public enum APITargetMock {
  case test
  case search(keyword: String)
}

extension APITargetMock: Requestable {
  public var scheme: String {
    return "https"
  }
  
  public var host: String {
    return "itunes.apple.com"
  }
  
  public var path: String {
    "/search"
  }
  
  public var baseURL: URL? {
    makeBaseURL()
  }
  
  public var httpMethod: HTTPMethod {
    .get
  }
  
  public var headers: HTTPHeaders? {
    .init([HTTPHeader.accept, HTTPHeader.contentType])
  }

}
