//
//  AppConfiguration.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription

public enum AppConfiguration: String {
  case dev = "DEV"
  case prod = "PROD"
  case test = "TEST"
  
  public var configurationName: ConfigurationName {
    .configuration(rawValue)
  }
}
