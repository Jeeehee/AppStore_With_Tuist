//
//  Color+.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import UIKit

public extension UIColor {
  
  // MARK: - Common
  
  static let kakaoBankYellow: UIColor  = .init(resource: .kakaoBankYellow)
  static let line: UIColor             = .init(resource: .line)
  static let text: UIColor             = .init(resource: .text)
  
  // MARK: - Grayscale
  
  static let black20: UIColor          = .init(resource: .black20)
  static let black30: UIColor          = .init(resource: .black30)
  static let black40: UIColor          = .init(resource: .black40)
  static let black50: UIColor          = .init(resource: .black50)
  static let black60: UIColor          = .init(resource: .black60)
  static let black70: UIColor          = .init(resource: .black70)
  static let black80: UIColor          = .init(resource: .black80)
  static let black90: UIColor          = .init(resource: .black90)
  
}

public extension UIColor {
  static func grayscale(color: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
      return UIColor(red: color/255, green: color/255, blue: color/255, alpha: alpha)
  }
}
