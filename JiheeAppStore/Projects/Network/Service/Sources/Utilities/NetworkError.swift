//
//  NetworkError.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
  case invalidURL(String)
  case invalidResponse
  case invalidStatusCode(Int)
  case invalidResponseData
  case invalidRequest
  case decodeError
  case encodeError
  case failedDataMapping
  case unknownError(URLResponse?)
  
  public var errorDescription: String {
    switch self {
    case .invalidURL(let urlString):
      return "Invalid URL \(String(describing: urlString))"
    case .invalidResponse:
      return "Invaild response."
    case .invalidStatusCode(let code):
      return "Invalid status code: \(code)"
    case .invalidResponseData:
      return "Invalid response data."
    case .invalidRequest:
      return "Invalid request."
    case .decodeError:
      return "Failed to decode."
    case .encodeError:
      return "Failed to encode."
    case .failedDataMapping:
      return "Failed to Data Mapping."
    case .unknownError(let response):
      return "Unknown Error from \(String(describing: response))"
    }
  }
}
