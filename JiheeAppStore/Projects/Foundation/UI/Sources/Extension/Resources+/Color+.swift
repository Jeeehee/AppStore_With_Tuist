//
//  Color+.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import UIKit

public extension UIColor {
  
  // MARK: - Common
  
  static let kakaoBankYellow   = UIColor.init(red: 251, green: 228, blue: 76, alpha: 0)
  static let line              = grayscale(color: 223)
  static let text              = grayscale(color: 10)
  
  // MARK: - Grayscale
  
  static let black20           = grayscale(color: 243)
  static let black30           = grayscale(color: 226)
  static let black40           = grayscale(color: 190)
  static let black50           = grayscale(color: 168)
  static let black60           = grayscale(color: 128)
  static let black70           = grayscale(color: 109)
  static let black80           = grayscale(color: 77)
  static let black90           = grayscale(color: 38)
  
}

public extension UIColor {
  static func grayscale(color: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
      return UIColor(red: color/255, green: color/255, blue: color/255, alpha: alpha)
  }
}
