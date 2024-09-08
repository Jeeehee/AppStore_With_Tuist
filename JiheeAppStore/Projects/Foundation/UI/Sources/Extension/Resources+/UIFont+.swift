//
//  UIFont+.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import UIKit

public extension UIFont {
  
  // MARK: - Common
  
  static let title            = custom(.bold, 26)
  static let title2           = custom(.semeBold, 22)
  static let body_Bold        = custom(.bold, 16)
  static let body_Medium      = custom(.medium, 16)
  static let body_Regualr     = custom(.regular, 16)
  static let detail_Bold      = custom(.bold, 14)
  static let detail_Medium    = custom(.medium, 14)
  static let detail_Regualr   = custom(.regular, 14)
  
  // MARK: - Pretendard
  
  enum Pretendard {
    case thin
    case light
    case regular
    case medium
    case semeBold
    case bold
    case black
    
    var name: String {
      switch self {
      case .thin:      return "Pretendard-Thin"
      case .light:     return "Pretendard-Light"
      case .regular:   return "Pretendard-Regular"
      case .medium:    return "Pretendard-Medium"
      case .semeBold:  return "Pretendard-SemeBold"
      case .bold:      return "Pretendard-Bold"
      case .black:     return "Pretendard-Black"
      }
    }
    
    var type: UIFont.Weight {
      switch self {
      case .thin:      return .thin
      case .light:     return .light
      case .regular:   return .regular
      case .medium:    return .medium
      case .semeBold:  return .semibold
      case .bold:      return .bold
      case .black:     return .black
      }
    }
  }
  
  static func custom(_ font: Pretendard, _ size: CGFloat) -> UIFont {
    return UIFont(name: font.name, size: size) ?? .systemFont(ofSize: size, weight: font.type)
  }
}
