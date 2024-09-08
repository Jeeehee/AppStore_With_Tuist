//
//  Requestable.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public protocol Requestable {
  var scheme: String { get }
  var host: String { get }
  var path: String { get }
  var baseURL: URL? { get }
  var httpMethod: HTTPMethod { get }
  var headers: HTTPHeaders? { get }
}

public extension Requestable {
  func makeBaseURL() -> URL? {
    var urlComponent = URLComponents()
    urlComponent.scheme = scheme
    urlComponent.host = host
    urlComponent.path = path
    return urlComponent.url
  }
}
