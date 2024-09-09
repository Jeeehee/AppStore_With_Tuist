//
//  AppStoreUsecase.swift
//  Usecase
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import RxSwift

import Entities

public protocol AppStoreUsecase {
  func search<T: Decodable>(_ type: T.Type, with: URLRequest) -> Single<T>
  func fetchRecentSearchHistory() -> Single<[SearchHistory]>
}
