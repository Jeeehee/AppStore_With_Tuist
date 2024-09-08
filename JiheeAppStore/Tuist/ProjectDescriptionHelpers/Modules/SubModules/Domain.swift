//
//  Domain.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import Foundation

public enum Domain:
  CaseIterable,
  ModuleInterface
{
  
  case Entities
  
  public var name: String {
    "\(self)"
  }
  
  public var path: String {
    "Projects/Domain/\(name)"
  }
  
}
