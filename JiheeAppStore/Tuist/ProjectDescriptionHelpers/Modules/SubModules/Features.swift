//
//  Features.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import Foundation

public enum Features:
  CaseIterable,
  ModuleInterface
{
  
  case Home
  case AppSearchResult
  case AppDetail
  
  public var name: String {
    "\(self)"
  }
  
  public var path: String {
    "Projects/Features/\(name)"
  }
  
}
