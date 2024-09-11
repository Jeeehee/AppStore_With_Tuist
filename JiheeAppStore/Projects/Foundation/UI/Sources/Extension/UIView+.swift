//
//  UIView+.swift
//  UI
//
//  Created by Jihee hwang on 9/8/24.
//  Copyright © 2024 Jihee. All rights reserved.
//

import UIKit

extension UIView {
  public func addSubviews(_ views: UIView...) {
    views.forEach { addSubview($0) }
  }
}

extension UIStackView {
  public func addArrangedSubviews(_ views: UIView...) {
    views.forEach { addArrangedSubview($0) }
  }
}
