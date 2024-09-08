//
//  String+.swift
//  AppFoundation
//
//  Created by Jihee hwang on 9/7/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

public extension String {
  var empty: Self { "" }
  
  var isNotEmpty: Bool {
    !self.isEmpty
  }
  
  func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
    let boundingBox = self.boundingRect(with: constraintRect,
                                        options: .usesLineFragmentOrigin,
                                        attributes: [.font: font], context: nil)
    
    return ceil(boundingBox.height)
  }
  
  func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
    let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
    let boundingBox = self.boundingRect(with: constraintRect,
                                        options: .usesLineFragmentOrigin,
                                        attributes: [.font: font], context: nil)
    
    return ceil(boundingBox.width)
  }
  
}
