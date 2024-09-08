//
//  URLRequest+.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

extension URLRequest: URLRequestConvertible {
  
  /// Body가 있는 경우
  public static func asURLRequest<E: Encodable>(
    api: URL,
    method: HTTPMethod,
    headers: HTTPHeaders?,
    body: E? = nil,
    timeout: TimeInterval = 30
  ) throws -> URLRequest {
    var request = URLRequest(url: api)
    request.timeoutInterval = timeout
    request.httpMethod = method.rawValue
    request.httpBody = try body?.toJson(body)
    request.allHTTPHeaderFields = headers?.dictionary
    return request
  }
  
  /// Body가 없는 경우
  public static func asURLRequest(
    api: URL,
    method: HTTPMethod,
    headers: HTTPHeaders?,
    timeout: TimeInterval = 30
  ) -> URLRequest {
    var request = URLRequest(url: api)
    request.timeoutInterval = timeout
    request.httpMethod = method.rawValue
    request.allHTTPHeaderFields = headers?.dictionary
    return request
  }
}
