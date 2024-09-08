//
//  UIImage+.swift
//  AppFoundationManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import UIKit

import Logger

public extension UIImage {

  // MARK: - Image
  
  static let splash     = imageAsset("splash")
  
  // MARK: - Icon
  
  static let favorite   = imageAsset("favorite")
  static let search     = imageAsset("search")
  
}

// MARK: - Extension

private extension UIImage {
  static func imageAsset(_ name: String) -> UIImage {
    guard let image = UIImage(named: name) else {
      Logger.debug("NoImage \(name)")
      return UIImage()
    }
    
    return image
  }
}
