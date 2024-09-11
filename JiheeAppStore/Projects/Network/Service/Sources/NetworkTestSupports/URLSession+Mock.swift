//
//  URLSession+Mock.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import Model

// MARK: - MockURLSessionDataTask

final class MockURLSessionDataTask: URLSessionDataTask {
  private let resumeHandler: () async throws -> Void
  
  init(resumeHandler: @escaping () async throws -> Void) {
    self.resumeHandler = resumeHandler
  }
  
  override func resume() {
    Task {
      try? await resumeHandler()
    }
  }
}

// MARK: - MockURLSession

public final class MockURLSession: URLSessionProtocol {
  public typealias Response = (data: Data?, urlResponse: HTTPURLResponse?, error: Error?)
  
  let response: Response
  
  private var dataTask: MockURLSessionDataTask?
  
  public init(response: Response) {
    self.response = response
  }
  
  public func data(for request: URLRequest, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
    try await withCheckedThrowingContinuation { continuation in
      dataTask = MockURLSessionDataTask {
        switch self.response {
        case let (data?, urlResponse?, nil):
          continuation.resume(returning: (data, urlResponse))
        case let (_, _, error?):
          continuation.resume(throwing: error)
        default:
          continuation.resume(throwing: URLError(.unknown))
        }
      }
      dataTask?.resume()
    }
  }
  
  public static func loadJSONData(fileName: String = "Kakao") -> Data {
    guard let moduleBundle = Bundle(identifier: "com.JiheeAppStore.Service"),
          let url = moduleBundle.url(forResource: fileName, withExtension: "json"),
          let data = try? Data(contentsOf: url)
    else {
      return Data()
    }
    
    return data
  }
}
