//
//  APITarget+Mock.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import Model
import Service

enum APITarget {
  case test
  case search(keyword: String)
}

extension APITarget: Requestable {
  var scheme: String {
    return "https"
  }
  
  var host: String {
    return "itunes.apple.com"
  }
  
  var path: String {
    "/search"
  }
  
  var baseURL: URL? {
    makeBaseURL()
  }
  
  var httpMethod: HTTPMethod {
    .get
  }
  
  var headers: HTTPHeaders? {
    .init([HTTPHeader.accept, HTTPHeader.contentType])
  }

}
