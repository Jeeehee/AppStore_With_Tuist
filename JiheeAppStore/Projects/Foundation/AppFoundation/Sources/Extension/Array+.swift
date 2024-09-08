//
//  Array+.swift
//  AppFoundation
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public extension Array {
  subscript(safe index: Int) -> Element? {
    return indices ~= index ? self[index] : nil
  }
  
  var isNotEmpty: Bool {
    !self.isEmpty
  }
}
