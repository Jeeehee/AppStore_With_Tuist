//
//  ServiceTests.swift
//  ServiceTests
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import XCTest

import Service
import Model

class ServiceTests: XCTestCase {
  
  private var sut: NetworkAdapter!
  
  private var mockResponse: MockURLSession.Response {
    let data: Data? = MockURLSession.loadJSONData()
    let successResponse = HTTPURLResponse(
      url: APITarget.test.baseURL!,
      statusCode: 200,
      httpVersion: nil,
      headerFields: nil
    )
    
    return (data: data, urlResponse: successResponse, nil)
  }
  
  override func setUpWithError() throws {
    sut = NetworkAdapterImpl(session: MockURLSession(response: mockResponse))
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }
  
  func test_API_잘_생성되는지() {
    // Given
    let prepayAPI = APITarget.test.baseURL?.absoluteString
    
    // When
    let testAPI = "https://itunes.apple.com/search"
    
    // Then
    XCTAssertEqual(prepayAPI, testAPI)
  }
  
  func test_QueryPrameter_잘_생성되는지() {
    // Given
    let queryStrings = ["entity=software", "country=kr", "term=KakaoBank"]
    let queryMock = QueryParamMock.init(term: "KakaoBank").toQueryParameters()
    
    // When
    let prepayAPI = APITarget.test.baseURL?.appendingQueryItems(queryMock ?? []).absoluteString ?? ""
    
    // Then
    XCTAssertTrue(queryStrings.filter { !prepayAPI.contains($0) }.isEmpty)
  }
  
  func test_API_요청_잘_되는지() async {
    // Given
    sut = NetworkAdapterImpl(session: MockURLSession(response: mockResponse))
    let request = URLRequest(url: APITarget.test.baseURL!)
    let data = MockURLSession.loadJSONData()
    
    // When
    let response = try? await sut.requestAPI(SearchResult.self, request: request)
    let expectation: SearchResult? = try? data.decode(SearchResult.self, data)
    
    // Then
    XCTAssertEqual(response?.resultCount, expectation?.resultCount)
  }
  
}
