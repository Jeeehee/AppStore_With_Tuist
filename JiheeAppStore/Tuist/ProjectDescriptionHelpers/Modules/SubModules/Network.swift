//
//  Network.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import Foundation

public enum Network:
  CaseIterable,
  ModuleInterface
{
  
  case Model
  
  public var name: String {
    "\(self)"
  }
  
  public var path: String {
    "Projects/Network/\(name)"
  }
  
}
