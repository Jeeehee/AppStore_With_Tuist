//
//  AppSearchRepositoryImpl.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/8/24.
//

import Foundation

import RxSwift

import Service
import Entities
import Repository

public final class AppSearchRepositoryImpl: AppSearchRepository {
  private let appSearchRepository: AppSearchRepository
  private let session: NetworkAdapter
  
  // MARK: - Initialization
  
  public init(
    appSearchRepository: AppSearchRepository,
    session: NetworkAdapter
  ) {
    self.appSearchRepository = appSearchRepository
    self.session = session
  }
  
  // MARK: - AppSearchRepository
  public func search<T: Decodable>(_ type: T.Type, with: URLRequest) -> Single<T> {
    Single<T>.create { [weak self] observer in
      guard let self else { return Disposables.create() }
      
      Task {
        do {
          let result = try await self.session.requestAPI(T.self, request: with)
          observer(.success(result))
        } catch {
          observer(.failure(error))
        }
      }
      
      return Disposables.create()
    }
  }
}
