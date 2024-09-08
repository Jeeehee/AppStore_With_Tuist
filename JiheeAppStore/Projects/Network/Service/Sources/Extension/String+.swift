//
//  String+.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public protocol URLConvertible {
  func asURL() throws -> URL
}

public extension String {
  func endPointFormatted(_ arguments: CVarArg...) -> Self {
    return String(format: self, arguments: arguments)
  }
}

// MARK: - URLConvertible

extension String: URLConvertible {
  public func asURL() throws -> URL {
    guard let url = URL(string: self) else {
      throw NetworkError.invalidURL(self)
    }
    
    return url
  }
}
