//
//  UsecaseImplTests.swift
//  UsecaseImpl
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import XCTest

import RxSwift

import Usecase
import Model
import Service

import UsecaseImpl

class UsecaseImplTests: XCTestCase {
  
  private var sut: AppStoreUsecase!
  private var disposeBag: DisposeBag!
  
  override func setUpWithError() throws {
    sut = AppStoreUsecaseImpl(
      appSearchRepository: AppSearchRepositoryMock(),
      searchHistoryRepository: SearchHistoryRepositoryMock()
    )
    
    disposeBag = DisposeBag()
    
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func test_키워드_검색_잘_되는지() {
    // Given
    let request = URLRequest.init(url: APITargetMock.test.baseURL!)
    
    // When
    sut.search(SearchResult.self, with: request)
      .subscribe(with: self) { owner, apps in
        // Then
        XCTAssertNotEqual(apps.resultCount, 0)
      }
      .disposed(by: disposeBag)
  }
  
  func test_최근검색어_히스토리_잘_가져와지는지() {
    // When
    sut.fetchRecentSearchHistory()
      .subscribe(with: self) { owner, history in
        // Then
        XCTAssertNotEqual(history.count, 0)
      }
      .disposed(by: disposeBag)
  }
  
}

