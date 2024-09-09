//
//  NetworkAdapterImpl.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public final class NetworkAdapterImpl: NetworkAdapter {
  
  private let session: URLSessionProtocol
  
  // MARK: - Initialization
  
  public init(session: URLSessionProtocol = URLSession.shared) {
    self.session = session
  }
  
  public func requestAPI<D: Decodable>(
    _ type: D.Type,
    request: URLRequest
  ) async throws -> D {
    let (data, response) = try await session.data(for: request, delegate: nil)
    
    guard let httpResponse = response as? HTTPURLResponse else {
      throw NetworkError.invalidResponse
    }
    
    guard validate(statusCode: httpResponse.statusCode) else {
      throw NetworkError.invalidStatusCode(httpResponse.statusCode)
    }
  
    return try data.decode(type, data)
  }
}

// MARK: - Private

extension NetworkAdapterImpl {
  private func validate(
    _ sequence: Range<Int> = 200..<300,
    statusCode: Int
  ) -> Bool {
    sequence.contains(statusCode)
  }
}
