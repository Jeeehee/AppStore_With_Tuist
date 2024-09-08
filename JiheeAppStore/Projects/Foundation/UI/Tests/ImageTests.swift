//
//  ImageTests.swift
//  UI
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import XCTest

import UI

final class ImageTests: XCTestCase {
  
  func test_Image_Not_Nil() {
    XCTAssertNotNil(UIImage.splash)
    XCTAssertNotNil(UIImage.favorite)
    XCTAssertNotNil(UIImage.search)
  }
}
