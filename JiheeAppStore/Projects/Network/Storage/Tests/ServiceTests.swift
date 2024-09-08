//
//  ServiceTests.swift
//  StorageTests
//
//  Created by Jihee hwang on 9/9/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import XCTest

import CoreData

import Storage

final class ServiceTests: XCTestCase {
  private var sut: Storage!
  
  override func setUpWithError() throws {
    sut = StorageImpl()
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func test_CoreData_저장_잘_되는지() {
    // Given
    let keyword = "카카오뱅크"
    
    // When
    sut.createData(keyword: keyword)
    let savedData = sut.readRecentSearcheKeywords(limit: 1)
    
    // Then
    XCTAssertEqual(keyword, savedData.first?.keyword)
  }
  
  func test_CoreData_읽기_잘_되는지() {
    // Given
    let keywords = ["카카오뱅크", "애플", "날씨"]
    
    // When
    keywords.forEach { sut.createData(keyword: $0) }
    let savedData = sut.readRecentSearcheKeywords(limit: keywords.count)
    
    // Then
    XCTAssertEqual(keywords.count, savedData.count)
  }
  
  func test_CoreData_삭제_잘_되는지() {
    // Given
    let keyword = "카카오뱅크"
    sut.createData(keyword: keyword)
    
    // When
    sut.deleteAll()
    let savedData = sut.readRecentSearcheKeywords(limit: 10)
    
    // Then
    XCTAssertEqual(savedData.count, 0)
  }
  
}
