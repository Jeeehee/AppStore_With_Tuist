//
//  Foundation.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import Foundation

public enum Foundation:
  CaseIterable,
  ModuleInterface
{

  case AppFoundation
  case Logger
  case UI
  
  public var name: String {
    "\(self)"
  }
  
  public var path: String {
    "Projects/Foundation/\(name)"
  }
  
}
