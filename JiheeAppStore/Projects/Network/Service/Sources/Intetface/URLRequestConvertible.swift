//
//  URLRequestConvertible.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public protocol URLRequestConvertible {
  /// Body가 있는 경우
  static func asURLRequest<E: Encodable>(
    api: URL,
    method: HTTPMethod,
    headers: HTTPHeaders?,
    body: E?,
    timeout: TimeInterval
  ) throws -> URLRequest
  
  /// Body가 없는 경우
  static func asURLRequest(
    api: URL,
    method: HTTPMethod,
    headers: HTTPHeaders?,
    timeout: TimeInterval
  ) -> URLRequest
}
