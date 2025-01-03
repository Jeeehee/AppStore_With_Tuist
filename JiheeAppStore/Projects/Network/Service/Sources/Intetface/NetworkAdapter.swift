//
//  NetworkAdapter.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public protocol NetworkAdapter {
  func requestAPI<D: Decodable>(_ type: D.Type, request: URLRequest) async throws -> D
}
