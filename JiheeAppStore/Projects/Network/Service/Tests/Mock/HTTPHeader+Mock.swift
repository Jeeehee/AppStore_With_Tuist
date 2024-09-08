//
//  HTTPHeader+Mock.swift
//  Service
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

import Service

extension HTTPHeader {
  static let accept = HTTPHeader()
    .builder
    .set(\.name, to: "accept")
    .set(\.value, to: "*/*")
    .build()
  
  static let contentType = HTTPHeader()
    .builder
    .set(\.name, to: "Content-Type")
    .set(\.value, to: "application/json")
    .build()
}
