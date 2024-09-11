//
//  AppSearchRepositoryMock.swift
//  UsecaseImpl
//
//  Created by Jihee hwang on 9/11/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RxSwift

import Repository
import Service
import Entities

public final class AppSearchRepositoryMock: AppSearchRepository {
  
  public init() {}
  
  public func search<T: Decodable>(_ type: T.Type, with: URLRequest) -> Single<T> {
    Single<T>.create { observer in
      let data = MockURLSession.loadJSONData()
      
      Task {
        do {
          let result = try data.decode(type, data)
          observer(.success(result))
        } catch {
          observer(.failure(error))
        }
      }
      
      return Disposables.create()
    }
  }

}
