//
//  AppSearchRepository.swift
//  Repository
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RxSwift

public protocol AppSearchRepository {
  func search<T: Decodable>(_ type: T.Type, with: URLRequest) -> Single<T>
}
