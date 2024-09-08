//
//  XCConfig.swift
//  AppStoreManifests
//
//  Created by Jihee hwang on 9/7/24.
//

import ProjectDescription

struct XCConfig {
  public static func xcconfig(_ configuration: AppConfiguration) -> Path {
    "./XCconfigs/\(configuration.rawValue).xcconfig"
  }
}
