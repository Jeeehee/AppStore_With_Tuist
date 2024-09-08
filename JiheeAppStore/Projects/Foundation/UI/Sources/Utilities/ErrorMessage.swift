//
//  ErrorMessage.swift
//  UI
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import Foundation

public struct ErrorMessage {
  public let title: String?
  public let message: String?
  public let confirmActionTitle: String
  
  public init(title: String? = nil, message: String? = nil, confirmActionTitle: String = String()) {
    self.title = title
    self.message = message
    self.confirmActionTitle = confirmActionTitle
  }
}
