//
//  Reusable.swift
//  UI
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public protocol Reusable {
  static var identifier: String { get }
}

extension Reusable {
  public static var identifier: String {
    String(describing: Self.self)
  }
}
